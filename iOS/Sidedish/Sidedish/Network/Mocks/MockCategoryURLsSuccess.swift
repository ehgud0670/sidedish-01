//
//  MockCategoryURLsSuccessStub.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct MockCategoryURLsSuccess: NetworkManagable {
    private let queue = DispatchQueue(label: "mockCategory")
    
    func requestResource(from urlString: String,
                         httpMethod: HTTPMethod, httpBody: Data?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) throws {
        guard let data = Data.jsonData(forResource: "SuccessCategoryURLsResponseStub") else { return }
        
        queue.async {
            completionHandler(data, nil, nil)
        }
    }
}
