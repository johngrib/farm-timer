//
//  MainViewModel.swift
//  FarmTimer
//
//  Created by eyemac on 15/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MainViewModel {

    var count: Int { return timers.count }
    private(set) var timers: [TimerViewModel] = [] {
        didSet {
            update()
        }
    }
    private var refreshHandler: () -> Void = { }

    func add(_ name: String) {
        timers.append(TimerViewModel(title: name))
    }

    func refresh(_ completion: @escaping () -> Void) {
        self.refreshHandler = completion
    }

    private func update() {
        refreshHandler()
    }
}
