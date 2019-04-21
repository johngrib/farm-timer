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
import Comparators
@testable import FarmTimer

class FarmTimerTests: XCTestCase {

    let clickAddTimerButton = PublishRelay<Void>()
    let newTimerTitle = PublishRelay<String>()
    var input: MainViewModel.Input!
    var viewModel: MainViewModel!

    override func setUp() {
        super.setUp()
        input = .init(clickAddTimer: clickAddTimerButton.asDriver(onErrorJustReturn: ()),
                      newTimerTitle: newTimerTitle.asDriver(onErrorJustReturn: "Error"))
        viewModel = MainViewModel(input)

        continueAfterFailure = false
    }

    func testShowTimerAlert() {
        let test = RxExpect()
        // 타이머 추가 이벤트 발생
        test.input(clickAddTimerButton, [.next(100, ())])
        // 타이머 얼럿 표시 스트림 emit
        test.assert(viewModel.showTimerAlert.map({ _ in 1 }), closure: { events in
            XCTAssertEqual(events, [.next(100, 1)])
        })
    }

    func testAddNewTimer() {
        let test = RxExpect()
        // 타이머 얼럿으로부터 타이머 정보 추가
        test.input(newTimerTitle, [.next(100, "공부")])
        test.assert(viewModel.timerViewModels, closure: { events in
            XCTAssertEqual(events, [
                .next(100, [TimerViewModel(title: "공부")])
            ])
        })
    }

}

class MockAlertFactory: AlertFactoryProtocol {

    let returnString: String

    init(_ returnString: String) {
        self.returnString = returnString
    }

    func presentAlertWithTextField(_ completion: @escaping (String?) -> Void) {
        completion(returnString)
    }
    
}

extension PublishRelay: ObserverType {

    public func on(_ event: Event<Element>) {
        switch event {
        case let .next(element): accept(element)
        case .completed, .error: fatalError()
        }
    }

    public func onNext(_ element: Element) {
        accept(element)
    }

    public func onError(_ error: Error) {
        fatalError()
    }

    public func onCompleted() {
        fatalError()
    }
}

extension BehaviorRelay: ObserverType {

    public func on(_ event: Event<Element>) {
        switch event {
        case let .next(element): accept(element)
        case .completed, .error: fatalError()
        }
    }

    public func onNext(_ element: Element) {
        accept(element)
    }

    public func onError(_ error: Error) {
        fatalError()
    }

    public func onCompleted() {
        fatalError()
    }
}
