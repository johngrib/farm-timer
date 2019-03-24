//
//  TimerGroupTests.swift
//  FarmTimerTests
//
//  Created by eyemac on 24/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import XCTest
@testable import FarmTimer

class TimerGroupTests: XCTestCase {

    var group: TimerGroup!

    override func setUp() {
        group = TimerGroup()
    }
    
    func testTimerGroupAddAndRemove() {
        
        group.add(item: TimerItem(title: "1"))
        XCTAssertEqual(group.items.count, 1)
        
        group.add(item: TimerItem(title: "2"))
        XCTAssertEqual(group.items.count, 2)
        
        group.remove(at: 0)
        XCTAssertEqual(group.items.count, 1)
        
        
    }
    
    func testTimerGroupStateSwitchAtomically() {
        
        group.add(item: TimerItem(title: "1"))
        group.add(item: TimerItem(title: "2"))
     
        XCTAssertEqual(group.state(at: 0), .empty)
        XCTAssertEqual(group.state(at: 1), .empty)
        
        group.start(at: 0)
        XCTAssertEqual(group.state(at: 0), .started)
        XCTAssertEqual(group.state(at: 1), .empty)
        
        group.start(at: 1)
        XCTAssertEqual(group.state(at: 0), .paused)
        XCTAssertEqual(group.state(at: 1), .started)
    }

}
