//
//  FarmTimerTests.swift
//  FarmTimerTests
//
//  Created by eyemac on 15/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import XCTest
import Quick
import Nimble
import RxSwift
import RxCocoa
import RxTest
import Action
import RxExpect
@testable import FarmTimer

class FarmTimerTests: QuickSpec {

    override func spec() {
        continueAfterFailure = false

        context("TimerCellModel에서") {
            context("무제한 타이머를 62초부터 생성하면") {
                var model: TimerViewModel!
                beforeEach {
                    model = TimerViewModel(title: "무제한", start: 62, end: nil)
                }
                it("timeString은 01:02 이다.") {
                    expect(model.timeString) == "0:01:02"
                }
                it("life는 live이다.") {
                    expect(model.life) == .live
                }
            }
        }
    }

}
