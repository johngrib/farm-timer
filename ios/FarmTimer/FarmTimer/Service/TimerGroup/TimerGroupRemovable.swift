//
//  TestGroupRemovable.swift
//  FarmTimer
//
//  Created by eyemac on 24/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


protocol TimerGroupRemovable {
    
    mutating func remove(at index: Int)
    
}

extension TimerGroup: TimerGroupRemovable {}

extension TimerGroupRemovable where Self == TimerGroup {
    
    mutating func remove(at index: Int) {
        self.items.remove(at: index)
    }
    
}
