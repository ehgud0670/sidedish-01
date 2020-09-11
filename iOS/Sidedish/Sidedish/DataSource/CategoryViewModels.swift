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
        static let categorysCountDidChange =
            Foundation.Notification.Name("categorysCountDidChange")
        static let categoryViewModelsDidChange = Foundation.Notification.Name("categoryViewModelsDidChange")
    }
    
    private var count = 0
    private var categoryViewModels: [Int: CategoryViewModel]
    private var disposeBag = DisposeBag()
    
    override init() {
        categoryViewModels = [Int: CategoryViewModel]()
    }
    
    func set(count: Int) {
        self.count = count
        NotificationCenter.default.post(
            name: Notification.categorysCountDidChange,
            object: self
        )
    }
    
    func categoryViewModel(at index: Int) -> CategoryViewModel? {
        guard index < categoryViewModels.count else { return nil }
        return categoryViewModels[index]
    }
    
    func insert(at index: Int, categoryViewModel: CategoryViewModel) {
        categoryViewModels[index] = categoryViewModel
        NotificationCenter.default.post(
            name: Notification.categoryViewModelsDidChange,
            object: self,
            userInfo: ["index": index]
        )
    }
}

//MARK:- UITableView DataSource
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
        
        productViewModel.product
            .bind(to: productCell.onData)
            .disposed(by: disposeBag)
        
        productViewModel.imageURLStr
            .flatMap(ImageUseCase.requestImageRx(from:))
            .bind(to: productCell.productImageView.rx.image)
            .disposed(by: disposeBag)
        
        return productCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return count
    }
}
