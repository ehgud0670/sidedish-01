//
//  ProductViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift

final class ProductViewModel: ViewModelBinding {
    typealias Key = BehaviorSubject<Product>
    private var disposeBag = DisposeBag()
    let productSubject: Key
    let id: Int
    
    init(product: Product) {
        self.productSubject = BehaviorSubject<Product>(value: product)
        self.id = product.banchan_id
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
}
