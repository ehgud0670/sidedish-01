//
//  CategoryURLsUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct CategoryURLsUseCase {
    static func requestCategoryURLs(with manager: NetworkManagable,
                                     completionHandler: @escaping ([String]?) -> ()) {
        try? manager.requestResource(from: "아직 없음",
                                     httpMethod: .get, httpBody: nil) {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryURLsResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        completionHandler(response.api)
        }
    }
}
