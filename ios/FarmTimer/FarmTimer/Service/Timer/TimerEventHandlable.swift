//
//  TimeEventHandlable.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


protocol TimerEventHandlable {
    
    func doTick()
    func setTickHandler(_ handler: @escaping (TimerServiceProtocol) -> Void)
    
}
