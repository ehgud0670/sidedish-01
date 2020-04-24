//
//  CategoryViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class CategoryViewModel: ViewModelBinding {
    typealias Key = CategoryHeader
    private let categoryHeader: Key
    private let productViewModels: [ProductViewModel]
    private var changedHandler: (Key) -> ()
    
    init(categoryHeader: CategoryHeader, productViewModels: [ProductViewModel],
         handler: @escaping (Key) -> () = { _ in }) {
        self.categoryHeader = categoryHeader
        self.productViewModels = productViewModels
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
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(categoryHeader)
    }
}
