//
//  ProductViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ProductViewModel: ViewModelBinding {
    typealias Key = Product
    private let product: Key
    private var changedHandler: (Key) -> ()
    var imageData: Data?
    
    init(product: Key, handler: @escaping (Key) -> () = { _ in }) {
        self.product = product
        self.changedHandler = handler
        configureImageData()
        changedHandler(product)
    }
    
    private func configureImageData() {
        ImageUseCase.imageData(from: product.image) { imageData in
            self.imageData = imageData
        }
    }
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(product)
    }
    
    static func text(price: Int?) -> String? {
        guard let price = price else { return nil }
        return String(price)
    }
    
    static var unitText: String {
        return "원"
    }
}
