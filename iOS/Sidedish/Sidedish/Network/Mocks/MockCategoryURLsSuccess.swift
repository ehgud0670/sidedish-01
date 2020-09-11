//
//  MockCategoryURLsSuccessStub.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct MockCategoryURLsSuccess: NetworkManagable {
    private let queue = DispatchQueue(label: "mockURLCategory")
    
    func requestResource(from urlString: String,
                         httpMethod: HTTPMethod, httpBody: Data?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) throws {
        guard let data = Data.jsonData(forResource: "SuccessCategoryURLsResponseStub") else { return }
        
        queue.asyncAfter(deadline: .now() + 1) {
            completionHandler(data, nil, nil)
        }
    }
}
