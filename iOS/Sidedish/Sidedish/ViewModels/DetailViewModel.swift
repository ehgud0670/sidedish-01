//
//  DetailViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class DetailViewModel: ViewModelBinding {
    typealias Key = ProductDetailData
    let productDetailData: ProductDetailData
    var thumbDatas: [Data]?
    var detailDatas: [Data]?
    
    init(productDetailData: ProductDetailData) {
        self.productDetailData = productDetailData
        configureThumbDatas()
        configureDetailDatas()
    }
    
    private func configureThumbDatas() {
        thumbDatas = [Data]()
        productDetailData.thumbs.forEach {
            ImageUseCase.imageData(from: $0) { thumbData in
                guard let thumbData = thumbData else { return }
                self.thumbDatas?.append(thumbData)
            }
        }
    }
    
    private func configureDetailDatas() {
        detailDatas = [Data]()
        productDetailData.details.forEach {
            ImageUseCase.imageData(from: $0) { thumbData in
                guard let thumbData = thumbData else { return }
                self.detailDatas?.append(thumbData)
            }
        }
    }
    
    static var priceTitleText: String {
        return "가격"
    }
    
    static var savingTitleText: String {
        return "적립금"
    }
    
    static var deliveryCostTitleText: String {
        return "배송비"
    }
    
    static var deliveryInfoTitleText: String {
        return "배송정보"
    }
}
