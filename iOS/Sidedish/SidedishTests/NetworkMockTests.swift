//
//  NetworkMockTests.swift
//  SidedishTests
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import Sidedish

final class NetworkMockTests: XCTestCase {
    func testMockCategoryURLsSuccessStub() {
        let mock = MockCategoryURLsSuccessStub()
        do {
            try mock.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil,
                                     completionHandler: { data, _, _ in
                                        XCTAssertNotNil(data)
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
    
    func testMockCategorySuccessStub() {
        let mock = MockCategorySuccessStub()
        do {
            try mock.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil,
                                     completionHandler: { data, _, _ in
                                        XCTAssertNotNil(data)
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
    
    func testMockProductDetailSuccessStub() {
        let mock = MockProductDetailSuccessStub()
        do {
            try mock.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil,
                                     completionHandler: { data, _, _ in
                                        XCTAssertNotNil(data)
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
