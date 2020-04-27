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
    let banchan_id: Int
    let data: ProductDetailData
}

struct ProductDetailData: Codable {
    let main_image: String
    let thumb_images: [String]
    let description: String
    let point: String
    let delivery_info: String
    let delivery_fee: String
    var sale_price: Int?
    let normal_price: Int
    let detail_images: [URL]
}
