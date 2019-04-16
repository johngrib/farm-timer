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

class MainViewModel {

    struct Input {
        let showAddTimerAlert: Driver<Void>
    }

    let disposeBag: DisposeBag

    init(coordinator: Coordinatorable = Coordinator(), input: Input) {

        self.disposeBag = DisposeBag()

        input.showAddTimerAlert.drive(onNext: coordinator.showAddTimerAlert).disposed(by: disposeBag)

    }

}
