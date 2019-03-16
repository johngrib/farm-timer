//
//  FarmTimerTests.swift
//  FarmTimerTests
//
//  Created by eyetin on 14/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import XCTest
@testable import FarmTimer

class TimerServiceTests: XCTestCase {
    
    var timerTicked: Bool = false
    var timerService: TimerServiceProtocol?
    
    override func setUp() {
        
        continueAfterFailure = false
        
        timerTicked = false
        timerService = MockTimerService(repeating: 1.0, time: .zero, timer: nil, state: .empty)
    }

    func testTimerService() {
        
        XCTAssertNil(timerService?.timer)
        XCTAssertEqual(timerService?.state, .empty)
        XCTAssertEqual(timerService?.time.value, 0.0)
        
        timerService = timerService?.started()
        XCTAssertNotNil(timerService?.timer)
        XCTAssertEqual(timerService?.state, .started)
        
        self.timerService?.setTickHandler { service in
            XCTAssertEqual(service.state, .started)
        }
        self.timerService?.doTick()
        XCTAssertEqual(timerService?.time.value, 1.0)
        
        timerService = timerService?.paused()
        XCTAssertEqual(timerService?.state, .paused)
        XCTAssertEqual(timerService?.time.value, 1.0)
        
        timerService = timerService?.cleared()
        XCTAssertEqual(timerService?.state, .empty)
        XCTAssertNil(timerService?.timer)
        XCTAssertEqual(timerService?.time.value, 0)
    }
    
}

class MockTimerService: TimerServiceProtocol {
    
    let repeating: TimeInterval
    let time: TimeContainer
    var timer: DispatchSourceTimer?
    let state: TimerState
    
    required init(repeating: TimeInterval, time: TimeContainer, timer: DispatchSourceTimer?, state: TimerState) {
        self.repeating = repeating
        self.time = time
        self.timer = timer
        self.state = state
    }
    
    class TickHandlerContainer {

        var tickHandler: ((TimerServiceProtocol) -> Void)?
        
    }
    
    var tickHandlerContainer: TickHandlerContainer = TickHandlerContainer()
    
//    deinit {
//        timer?.resume()
//    }
    
    func doTick() {
        time.increment(with: repeating)
        tickHandlerContainer.tickHandler?(self)
    }
    
    func setTickHandler(_ handler: @escaping (TimerServiceProtocol) -> Void) {
        self.tickHandlerContainer.tickHandler = handler
    }
}
