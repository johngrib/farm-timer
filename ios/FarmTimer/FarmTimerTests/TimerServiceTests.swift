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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTimerService() {
        
    }
    
}

protocol TimeIntervalContainable {
    
    var time: TimeInterval { get }
    
}

enum TimerState {
    
    case empty // 타이머를 생성하지 않은 상태
    case started // 타이머를 실행한 상태
    case paused // 타이머를 정지한 상태
    
}

protocol TimerContainable {
    
    var timer: DispatchSourceTimer? { get }
    var timerState: TimerState { get }
    
}

protocol TimerProcessable {
    
    /// 타이머를 실행합니다. 타이머를 생성하기 전이라면 타이머를 생성하고, 정지한 상태라면 다시 실행하고, 이미 실행한 상태라면 아무런 작업을 하지 않습니다.
    func start()
    
    /// 타이머를 멈춥니다. 이미 멈춘 상태라면 무시합니다.
    func pause()
    
    /// 타이머를 정지하고, 타이머 인스턴스를 메모리에서 제거합니다. 이미 정지한 상태라면 제거만 합니다.
    func clear()
    
}

extension TimerProcessable where Self: TimerContainable {
    
    /// 타이머를 생성하고 반환합니다.
    func createTimer() -> DispatchSourceTimer {
        return DispatchSource.makeTimerSource()
    }
    
}

class MockTimerService {
    
    var time: TimeInterval = 0
    
    var timer: DispatchSourceTimer?
    lazy var timerState: TimerState = .empty
    
}

extension MockTimerService: TimeIntervalContainable {}
extension MockTimerService: TimerContainable {}
extension MockTimerService: TimerProcessable {
    
    func start() {
        
    }
    
    func pause() {
        
    }
    
    func clear() {
        
    }
    
}
