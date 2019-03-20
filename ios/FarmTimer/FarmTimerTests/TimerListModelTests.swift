//
//  TimerListModelTests.swift
//  FarmTimerTests
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import XCTest
@testable import FarmTimer

class TimerListModelTests: XCTestCase {

    var listViewModel: TimerListViewModel!
    var delegator: MockTimerListViewModelDelegator!
    
    override func setUp() {
        listViewModel = TimerListViewModel()
        delegator = MockTimerListViewModelDelegator(listViewModel)
    }

    func testAppend() {
        
        XCTAssertEqual(listViewModel.numberOfSections, 0)
        
        listViewModel.add(TimerItem(title: "운동", time: 0, state: .empty))
        XCTAssertEqual(listViewModel.numberOfSections, 1)
        XCTAssertEqual(listViewModel.numberOfItems(at: 0), 1)
        XCTAssertEqual(listViewModel.itemAt(row: 0, section: 0), TimerItem(title: "운동", time: 0, state: .empty))
        XCTAssertNil(listViewModel.itemAt(row: 0, section: 1))
        
        XCTAssertTrue(delegator.added)
    }

}

class MockTimerListViewModelDelegator: TimerListViewModelDelegate {
    
    init(_ model: TimerListViewModel) {
        model.delegate = self
    }
    
    var added: Bool = false
    
    func listViewAdded(_ model: TimerListViewModel) {
        added = true
    }
}
