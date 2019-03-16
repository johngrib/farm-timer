//
//  TimeProcessable.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


protocol TimerProcessable {
    
    func started() -> Self?
    
    func paused() -> Self?
    
    func cleared() -> Self?
    
}
