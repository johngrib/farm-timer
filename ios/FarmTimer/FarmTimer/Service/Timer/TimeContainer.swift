//
//  TimeContainer.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


class TimeContainer {
    
    private(set) var value: TimeInterval = 0
    
    init(time: TimeInterval = 0) {
        self.value = time
    }
    
    static var zero: TimeContainer { return TimeContainer() }
    
    func increment(with value: TimeInterval) {
        self.value += value
    }
    
}
