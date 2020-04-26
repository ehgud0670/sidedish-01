//
//  CategoryViewModelUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct CategoryViewModelUseCase {
    static func makeMenuViewModel(from urlString: String,
                                   with manager: NetworkManagable,
                                   completionHandler: @escaping (CategoryViewModel?) -> ()) {
        try? manager.requestResource(from: urlString, httpMethod: .get, httpBody: nil,
                                     completionHandler: {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        let categoryHeader = CategoryHeader(id: response.category_id,
                                                                            name: response.category_name,
                                                                            description: response.category_description)
                                        let productViewModels =  response.banchans.map { ProductViewModel(product: $0) }
                                        let categoryViewModel = CategoryViewModel(categoryHeader: categoryHeader, productViewModels: productViewModels)
                                        completionHandler(categoryViewModel)
        })
    }
}
