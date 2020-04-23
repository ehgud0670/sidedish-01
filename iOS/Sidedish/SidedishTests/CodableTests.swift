//
//  CodableTests.swift
//  SidedishTests
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import Sidedish

final class CodableTests: XCTestCase {
    func testURLsResponse() {
        let mock = MockCategoryURLsSuccessStub()
        do {
            try mock.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil,
                                     completionHandler: { data, _, _ in
                                        guard let data = data else { return }
                                        let response = try? JSONDecoder().decode(CategoryURLsResponse.self,
                                                                                 from: data)
                                        XCTAssertNotNil(response)
            })
        } catch {
            switch  error {
            case NetworkErrorCase.invalidURL:
                print("invalidURL")
            default:
                break
            }
        }
    }
    
    func testCategoryResponse() {
        let mock = MockCategorySuccessStub()
        do {
            try mock.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil,
                                     completionHandler: { data, _, _ in
                                        guard let data = data else { return }
                                        let response = try? JSONDecoder().decode(CategoryResponse.self,
                                                                               from: data)
                                        XCTAssertNotNil(response)
            })
        } catch {
            switch  error {
            case NetworkErrorCase.invalidURL:
                print("invalidURL")
            default:
                break
            }
        }
    }
}
