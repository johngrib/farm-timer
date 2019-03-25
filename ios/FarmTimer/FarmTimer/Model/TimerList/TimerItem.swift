//
//  TimerItem.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

struct TimerItem {
    let title: String
    let time: TimeInterval
    let state: TimerState
    weak var service: TimerService?
    
    init(title: String, time: TimeInterval = 0, state: TimerState = .empty) {
        self.title = title
        self.time = time
        self.state = state
    }
    
    func updated(state: TimerState) -> TimerItem {
        return TimerItem(title: title, time: time, state: state)
    }
}

extension TimerItem: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: TimerItem, rhs: TimerItem) -> Bool {
        return lhs.title == rhs.title
    }
    
}
