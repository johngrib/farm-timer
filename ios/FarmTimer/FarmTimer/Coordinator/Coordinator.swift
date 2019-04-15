//
//  Coordinator.swift
//  FarmTimer
//
//  Created by eyemac on 15/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol Coordinatorable {
    
    func showAddTimerAlert(_ action: Driver<Void>)
    
}
