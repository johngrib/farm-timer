//
//  TimerService.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

class TimerService: TimerServiceProtocol {
    
    var repeating: TimeInterval
    
    var timer: DispatchSourceTimer?
    
    var state: TimerState
    
    var time: TimeContainer
    
    private var tickHandler: ((TimerServiceProtocol) -> Void)?
    
    required init(repeating: TimeInterval, time: TimeContainer, timer: DispatchSourceTimer?, state: TimerState) {
        self.repeating = repeating
        self.time = time
        self.timer = timer
        self.state = state
    }
    
    private func setup() {
        timer?.setEventHandler(handler: { [weak self] in
            self?.doTick()
        })
    }
    
    func doTick() {
        time.increment(with: repeating)
        self.tickHandler?(self)
    }
    
    func setTickHandler(_ handler: @escaping (TimerServiceProtocol) -> Void) {
        self.tickHandler = handler
    }
    
}
