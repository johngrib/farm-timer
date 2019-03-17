//
//  TimerItem.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

struct TimerItem: Hashable {
    let title: String
    let time: TimeInterval
    let state: TimerState
}
