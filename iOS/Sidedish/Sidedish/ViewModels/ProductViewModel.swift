//
//  ProductViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class ProductViewModel: ViewModelBinding {
    typealias Key = Observable<Product>
    private var disposeBag = DisposeBag()
    let product: Key
    let imageURLStr: Observable<String>
    let id: Int
    
    init(product: Product) {
        let productSubject = BehaviorSubject<Product>(value: product)
        let imageSubject = BehaviorSubject(value: product.image)
        
        self.product = productSubject.asObserver()
        self.imageURLStr = imageSubject.asObserver()
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
