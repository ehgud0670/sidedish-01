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
    
    init(product: Key, handler: @escaping (Key) -> () = { _ in }) {
        self.product = product
        self.changedHandler = handler
        changedHandler(product)
    }
    
    func bindImage(resultHandler: @escaping (UIImage) -> Void) {
        ImageUseCase.requestImage(from: product.image) { image in
            guard let image = image else { return }
            
            resultHandler(image)
        }
    }
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(product)
    }
    
    static func text(price: Int?) -> String? {
        guard let price = price else { return nil }
        
        var text = String(price)
        text.insert(",", at: text.index(text.endIndex, offsetBy: -3))
        return text
    }
    
    static var unitText: String {
        return "원"
    }
    
    var id: Int {
        product.banchan_id
    }
}
