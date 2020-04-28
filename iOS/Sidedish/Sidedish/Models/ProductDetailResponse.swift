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
    let details: [URL]
    let banchanDetail_Id: Int
}
