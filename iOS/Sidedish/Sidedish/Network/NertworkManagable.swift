//
//  NertworkManagable.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol NetworkManagable {
    func requestResource(from urlString: String,
                         httpMethod: HTTPMethod, httpBody: Data?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) throws
}
