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
import RxBlocking
@testable import FarmTimer

class FarmTimerTests: QuickSpec {

    override func spec() {
        continueAfterFailure = false

        var alertFactory: MockAlertFactory!
        var coordinator: Coordinator!
        var viewModelInput: MainViewModel.Input!
        var viewModel: MainViewModel!
        var showAddTimerAlertEvent: PublishRelay<Void>!
        
        beforeEach {
            alertFactory = MockAlertFactory()
            coordinator = Coordinator(alertFactory: alertFactory)
            showAddTimerAlertEvent = PublishRelay()
            viewModelInput = .init(showAddTimerAlert: showAddTimerAlertEvent.asDriver(onErrorJustReturn: ()))
            viewModel = MainViewModel(coordinator: coordinator, input: viewModelInput)
        }
        
        context("더하기 버튼 누르면") {
            it("타이머 추가 얼럿을 표시한다.") {
                // action
                showAddTimerAlertEvent.accept(())

                expect(alertFactory.calledFunction) == "presentAlertWithTextField(_:)"
            }
            context("타이머 추가 얼럿을 완료하면") {
                it("새로운 타이머를 추가한다.") {
                    
                }
            }
        }
        
    }
}

class MockAlertFactory: AlertFactoryProtocol {

    var calledFunction: String?

    func presentAlertWithTextField(_ completion: @escaping (String?) -> Void) {
        calledFunction = #function
    }
    
}
