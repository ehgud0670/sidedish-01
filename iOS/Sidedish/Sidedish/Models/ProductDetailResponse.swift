//
//  ProductDetailResponse.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct ProductDetailResponse: Codable {
    let status: Status
    let data: ProductDetailData
}

struct ProductDetailData: Codable {
    let normal_price: Int
    var sale_price: Int?
    let main_image: String
    let description: String
    let point: String
    let delivery_info: String
    let delivery_fee: String
    let title: String
    let thumbs: [String]
    let details: [String]
    let banchanDetail_Id: Int
    
    func iterateThumbs(handler: (String, Int) -> Void) {
        var index = 0
        thumbs.forEach {
            handler($0, index)
            index += 1
        }
    }
    
    func iterateDetails(handler: (String, Int) -> Void) {
        var index = 0
        details.forEach {
            handler($0, index)
            index += 1
        }
    }
}
