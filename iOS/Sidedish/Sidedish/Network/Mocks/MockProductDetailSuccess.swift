//
//  MockProductDetailSuccessStub.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct MockProductDetailSuccess: NetworkManagable {
    private let mockQueue = DispatchQueue(label: "MockProductDetail")
    
    func requestResource(from urlString: String,
                         httpMethod: HTTPMethod, httpBody: Data?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) throws {
        guard let data = Data.jsonData(forResource: "SuccessProductDetailResponseStub") else { return }
        
        mockQueue.async {
            completionHandler(data, nil, nil)
        }
    }
}
