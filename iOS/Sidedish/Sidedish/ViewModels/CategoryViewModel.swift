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
    typealias Key = BehaviorSubject<CategoryHeader>
    let categoryHeader: Key
    private let productViewModels: [ProductViewModel]
    private var changedHandler: (Key) -> ()
    
    init(category: Category, handler: @escaping (Key) -> () = { _ in }) {
        self.categoryHeader = BehaviorSubject<CategoryHeader>(value: category.header)
        self.productViewModels = category.products.map { ProductViewModel(product: $0) }
        self.changedHandler = handler
        changedHandler(categoryHeader)
    }
    
    func productViewModel(at index: Int) -> ProductViewModel? {
        guard index < productViewModels.count else { return nil }
        return productViewModels[index]
    }
    
    var productViewModelsCount: Int {
        return productViewModels.count
    }
}
