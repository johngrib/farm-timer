//
//  AlertFactory.swift
//  FarmTimer
//
//  Created by eyemac on 16/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

protocol AlertFactoryProtocol {

    func presentAlertWithTextField(_ completion: @escaping (String?) -> Void)

}

struct AlertFactory: AlertFactoryProtocol {
    func presentAlertWithTextField(_ completion: @escaping (String?) -> Void) {
        
    }
}
