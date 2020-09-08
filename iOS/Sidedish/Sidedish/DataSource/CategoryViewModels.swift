//
//  CategoryViewModels.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class CategoryViewModels: NSObject {
    enum Notification {
        static let categoryViewModelsDidChange = Foundation.Notification.Name("categoryViewModelsDidChange")
    }
    
    private var count: Int?
    private var categoryViewModels: [Int: CategoryViewModel]
    private var disposeBag = DisposeBag()
    
    override init() {
        categoryViewModels = [Int: CategoryViewModel]()
    }
    
    func set(count: Int) {
        self.count = count
    }
    
    func categoryViewModel(at index: Int) -> CategoryViewModel? {
        guard index < categoryViewModels.count else { return nil }
        return categoryViewModels[index]
    }
    
    func insert(at index: Int, categoryViewModel: CategoryViewModel) {
        categoryViewModels[index] = categoryViewModel
        NotificationCenter.default.post(name: Notification.categoryViewModelsDidChange,
                                        object: self, userInfo: ["index": index])
    }
}

extension CategoryViewModels: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = categoryViewModels[section]?.productViewModelsCount else { return 0 }
        
        return count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(
            withIdentifier: ProductCell.reuseIdentifier,
            for: indexPath) as? ProductCell else { return ProductCell() }
        guard let productViewModel = categoryViewModels[indexPath.section]?.productViewModel(
            at: indexPath.row) else { return ProductCell() }
        
        productViewModel.productSubject.subscribe(onNext: {
            productCell.onData.onNext($0)
            
            ImageUseCase.requestImage(from: $0.image) { image in
                guard let image = image else { return }
                productCell.configure(image: image)
            }
        }).disposed(by: disposeBag)
        
        return productCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return count ?? 0
    }
}
