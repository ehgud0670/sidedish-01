//
//  ProductViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class ProductsViewModel: ViewModelBinding {
    typealias Key = [Product]
    private let products: Key
    private var changedHandler: (Key) -> ()
    
    init(products: Key, handler: @escaping (Key) -> () = { _ in }) {
        self.products = products
        self.changedHandler = handler
        changedHandler(products)
    }
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(products)
    }
    
    var productsCount: Int {
        return products.count
    }
}
