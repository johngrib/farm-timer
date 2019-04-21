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
import Comparators

class MainViewModel {

    struct Input {
        let clickAddTimer: Driver<Void>
        let newTimerTitle: Driver<String>
    }

    let disposeBag: DisposeBag

    let showTimerAlert: Driver<Void>

    let timerViewModels: BehaviorRelay<[TimerViewModel]>

    init(_ input: Input) {

        self.disposeBag = DisposeBag()

        showTimerAlert = input.clickAddTimer.asSharedSequence()

        let timerViewModels = BehaviorRelay<[TimerViewModel]>(value: [])
        self.timerViewModels = timerViewModels
        input.newTimerTitle
            .map(TimerViewModel.init)
            .filter(timerViewModels.value.not.contains)
            .drive(onNext: { title in

            })
            .disposed(by: disposeBag)

    }

}
