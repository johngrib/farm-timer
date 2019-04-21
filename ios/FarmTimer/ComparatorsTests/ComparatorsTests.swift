//
//  ComparatorsTests.swift
//  ComparatorsTests
//
//  Created by eyemac on 21/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import XCTest
@testable import Comparators

class ComparatorsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsNot() {
        XCTAssertTrue("A".is.to("A"))
        XCTAssertFalse("B".is.to("A"))
        XCTAssertTrue("A".is.not.to("B"))
        XCTAssertFalse("A".is.not.to("A"))
        XCTAssertTrue("A".is.in(["A", "B"]))
        XCTAssertFalse("A".is.in(["C", "B"]))
        XCTAssertTrue("A".is.not.in(["C", "B"]))
        XCTAssertFalse("A".is.not.in(["A", "B"]))
        XCTAssertTrue(["A", "B"].contains("B"))
        XCTAssertFalse(["A", "B"].contains("C"))
        XCTAssertTrue(["A", "B"].not.have("C"))
        XCTAssertTrue("B".is.in(["A", "B"]))
        XCTAssertFalse("C".is.in(["A", "B"]))
    }

}
