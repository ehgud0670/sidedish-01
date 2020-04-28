//
//  NetworkManager.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum Format {
    static let jsonType = "application/json"
}

enum NetworkErrorCase: Error {
    case invalidURL
    case notFound
}

struct NetworkManager: NetworkManagable {
    func requestResource(from urlString: String,
                         httpMethod: HTTPMethod, httpBody: Data?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) throws {
        guard let url = URL(string: urlString) else { throw NetworkErrorCase.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(Format.jsonType, forHTTPHeaderField: HTTPHeader.headerAccept)
        urlRequest.addValue(Format.jsonType, forHTTPHeaderField: HTTPHeader.headerContentType)
        
        urlRequest.httpMethod = httpMethod.description
        urlRequest.httpBody = httpBody
        
        URLSession.shared.dataTask(with: urlRequest) {
            data, urlResponse, error in
            completionHandler(data, urlResponse, error)
        }.resume()
    }
}
