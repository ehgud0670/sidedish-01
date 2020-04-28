//
//  CategoryViewModelUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct CategoryUseCase {
    static func makeCategory(from urlString: String,
                                   with manager: NetworkManagable,
                                   completionHandler: @escaping (Category?) -> ()) {
        try? manager.requestResource(from: urlString, httpMethod: .get, httpBody: nil,
                                     completionHandler: {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        let header = CategoryHeader(id: response.category_id,
                                                                            name: response.category_name,
                                                                            description: response.category_description)
                                        let category = Category(header: header,
                                                                products: response.banchans)
                                        completionHandler(category)
        })
    }
}
