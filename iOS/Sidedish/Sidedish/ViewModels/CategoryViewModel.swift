//
//  CategoryViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

import RxSwift

final class CategoryViewModel: ViewModelBinding {
    typealias Key = Observable<CategoryHeader>
    let categoryHeader: Key
    private let productViewModels: [ProductViewModel]
    
    init(category: Category) {
        let headerSubject = BehaviorSubject<CategoryHeader>(value: category.header)
        categoryHeader = headerSubject.asObserver()
        
        self.productViewModels = category.products.map { ProductViewModel(product: $0) }
    }
    
    func productViewModel(at index: Int) -> ProductViewModel? {
        guard index < productViewModels.count else { return nil }
        
        return productViewModels[index]
    }
    
    var productViewModelsCount: Int {
        return productViewModels.count
    }
}
