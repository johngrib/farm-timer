//
//  TimerGroupAddable.swift
//  FarmTimer
//
//  Created by eyemac on 24/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

protocol TimerGroupAddable {
    
}

extension TimerGroup: TimerGroupAddable {}

extension TimerGroupAddable where Self == TimerGroup {
    
}
