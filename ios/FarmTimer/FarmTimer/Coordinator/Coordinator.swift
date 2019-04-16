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

    var alertFactory: AlertFactoryProtocol { get }

    init(alertFactory: AlertFactoryProtocol)

    func showAddTimerAlert()
}

class Coordinator: Coordinatorable {

    let alertFactory: AlertFactoryProtocol

    required init(alertFactory: AlertFactoryProtocol = AlertFactory()) {
        self.alertFactory = alertFactory
    }


    func showAddTimerAlert() {
        alertFactory.presentAlertWithTextField { result in
            
        }
    }

}
