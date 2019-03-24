//
//  TimerGroupStateSwitchable.swift
//  FarmTimer
//
//  Created by eyemac on 24/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

protocol TimerGroupStateSwitchable {
    
    func state(at index: Int) -> TimerState
    mutating func pause(at index: Int)
    mutating func start(at index: Int)
}

extension TimerGroup: TimerGroupStateSwitchable {}

extension TimerGroupStateSwitchable where Self == TimerGroup {
    
    func state(at index: Int) -> TimerState {
        return self.items[index].state
    }
    
    mutating func start(at index: Int) {
        for i in 0..<self.items.count where i != index {
            let item = self.items[i]
            guard item.state == .started else { continue }
            self.items[i] = item.updated(state: .paused)
        }
        self.items[index] = self.items[index].updated(state: .started)
    }
    
    mutating func pause(at index: Int) {
        self.items[index] = self.items[index].updated(state: .paused)
    }
    
}
