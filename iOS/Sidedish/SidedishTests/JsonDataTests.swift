//
//  JsonDataTests.swift
//  SidedishTests
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import Sidedish

final class JsonDataTests: XCTestCase {
    func testSuccessCategoryURLsResponseStub() {
        let data = Data.jsonData(forResource: "SuccessCategoryURLsResponseStub")
        XCTAssertNotNil(data)
    }
    
    func testSuccessCategoryResponseStub() {
        let data = Data.jsonData(forResource: "SuccessCategoryResponseStub")
        XCTAssertNotNil(data)
    }
    
    func testSuccessProductDetailResponseStub() {
        let data = Data.jsonData(forResource: "SuccessProductDetailResponseStub")
        XCTAssertNotNil(data)
    }
}
