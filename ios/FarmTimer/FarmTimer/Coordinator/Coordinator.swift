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

    var alertFactory: AlertFactoryProtocol { get set }

    init()

    func showAddTimerAlert()
}

class Coordinator: Coordinatorable {

    lazy var alertFactory: AlertFactoryProtocol = AlertFactory()

    required init() {}

    func showAddTimerAlert() {
        alertFactory.presentAlertWithTextField { result in
            
        }
    }

}
