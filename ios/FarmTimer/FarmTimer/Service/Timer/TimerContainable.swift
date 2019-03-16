//
//  TimerContainable.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


protocol TimerContainable {
    
    var repeating: TimeInterval { get }
    var timer: DispatchSourceTimer? { get }
    var state: TimerState { get }
    var time: TimeContainer { get }
    
}
