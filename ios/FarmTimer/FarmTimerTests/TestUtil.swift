//
//  TestUtil.swift
//  FarmTimerTests
//
//  Created by eyetin on 16/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func waitUntil(description: String = "", timeout: TimeInterval = 1, task: @escaping (Done) -> Void) {
        
        let done = Done(expectation: XCTestExpectation(description: description))
        done.wait(timeout: timeout, in: self)
        
        task(done)
        
    }
}

struct Done {
    var expectation: XCTestExpectation
    
    func wait(timeout: TimeInterval, in testCase: XCTestCase) {
        testCase.wait(for: [expectation], timeout: timeout)
    }
    
    func finish() {
        expectation.fulfill()
    }
}
