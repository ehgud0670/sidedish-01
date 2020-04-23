//
//  ProductViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class ProductViewModel: ViewModelBinding {
    typealias Key = Product
    private let product: Key
    private var changedHandler: (Key) -> ()
    
    init(product: Key, handler: @escaping (Key) -> () = { _ in }) {
        self.product = product
        self.changedHandler = handler
        changedHandler(product)
    }
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(product)
    }
}
