//
//  TimeState.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation


enum TimerState {
    
    case empty // 타이머를 생성하지 않은 상태
    case started // 타이머를 실행한 상태
    case paused // 타이머를 정지한 상태
    
}
