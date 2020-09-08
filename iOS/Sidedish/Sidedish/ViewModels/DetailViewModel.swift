//
//  DetailViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DetailViewModel: ViewModelBinding {
    typealias Key = ProductDetailData
    let productDetailData: ProductDetailData
    
    init(productDetailData: ProductDetailData) {
        self.productDetailData = productDetailData
    }
    
    func bindThumbImages(resultHandler: @escaping (UIImage, Int) -> Void) {
        productDetailData.iterateThumbs { path, index in
            ImageUseCase.requestImage(from: path) { thumbImage in
                guard let thumbImage = thumbImage else { return }
                
                resultHandler(thumbImage, index)
            }
        }
    }
    
    func bindDetailImages(resultHandler: @escaping (UIImage, Int) -> Void) {
        productDetailData.iterateDetails { path, index in
            ImageUseCase.requestImage(from: path) { detailImage in
                guard let detailImage = detailImage else { return }
                
                resultHandler(detailImage, index)
            }
        }
    }
    
    static var priceTitleText: String {
        return "가격"
    }
    
    static var pointTitleText: String {
        return "적립금"
    }
    
    static var deliveryCostTitleText: String {
        return "배송비"
    }
    
    static var deliveryInfoTitleText: String {
        return "배송정보"
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
