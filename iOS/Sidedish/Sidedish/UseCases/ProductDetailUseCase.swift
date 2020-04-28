//
//  CategoryDetailUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/28.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct ProductDetailUseCase {
    enum EndPoints {
        static let banchans = "http://15.165.210.164:8080/banchans/"
    }
    
    static func requestCategoryDetail(from urlString: String,
                                   with manager: NetworkManagable,
                                   completionHandler: @escaping (ProductDetailData?) -> ()) {
        try? manager.requestResource(from: urlString, httpMethod: .get, httpBody: nil,
                                     completionHandler: {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(ProductDetailResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        completionHandler(response.data)
        })
    }
}
