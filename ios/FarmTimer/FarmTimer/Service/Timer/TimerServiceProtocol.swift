//
//  TimerServiceProtocol.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


protocol TimerServiceProtocol: TimerContainable, TimerProcessable, TimerEventHandlable {
    
    init(repeating: TimeInterval, time: TimeContainer, timer: DispatchSourceTimer?, state: TimerState)
    
    func setupTimer()
    
}

private let timerQueue = DispatchQueue(label: "com.farmtimer.timer")

extension TimerServiceProtocol {
    
    /// 타이머를 생성하고 반환합니다.
    func createTimer() -> DispatchSourceTimer {
        return DispatchSource.makeTimerSource(queue: timerQueue)
    }
    
    func setupTimer() {
        
        timer?.schedule(deadline: .now(), repeating: repeating, leeway: .milliseconds(0))
        
    }
    
    func started() -> Self? {
        let service = Self.init(repeating: repeating, time: time, timer: createTimer(), state: .started)
        defer {
            service.setupTimer()
            service.timer?.resume()
        }
        return service
    }
    
    func paused() -> Self? {
        let service = Self.init(repeating: repeating, time: time, timer: nil, state: .paused)
        defer {
            service.timer?.suspend()
        }
        return service
    }
    
    func cleared() -> Self? {
        let service = Self.init(repeating: repeating, time: .zero, timer: nil, state: .empty)
        defer {
            service.timer?.cancel()
        }
        return service
    }
    
}
