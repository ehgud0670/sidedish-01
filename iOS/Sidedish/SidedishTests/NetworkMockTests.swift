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
        let mock = MockCategoryURLsSuccess()
        try? mock.requestResource(from: "",
                                  httpMethod: .get, httpBody: nil,
                                  completionHandler: { data, _, _ in
                                    XCTAssertNotNil(data)
        })
    }
    
    func testMockCategorySuccessStub() {
        let mock = MockCategorySuccess()
        try? mock.requestResource(from: "",
                                  httpMethod: .get, httpBody: nil,
                                  completionHandler: { data, _, _ in
                                    XCTAssertNotNil(data)
        })
    }
    
    func testMockProductDetailSuccessStub() {
        let mock = MockProductDetailSuccess()
        try? mock.requestResource(from: "",
                                  httpMethod: .get, httpBody: nil,
                                  completionHandler: { data, _, _ in
                                    XCTAssertNotNil(data)
        })
    }
}
