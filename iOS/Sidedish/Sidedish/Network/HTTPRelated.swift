//
//  HTTP.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum HTTPHeader {
    static let headerContentType = "Content-Type"
    static let headerAccept = "Accept"
}

enum HTTPMethod: String, CustomStringConvertible {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case put = "PUT"
    
    var description: String {
        return self.rawValue
    }
}


