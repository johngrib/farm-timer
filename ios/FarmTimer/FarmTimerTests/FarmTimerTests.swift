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
import RxBlocking
@testable import FarmTimer

class FarmTimerTests: QuickSpec {

    override func spec() {
        continueAfterFailure = false
        
        var viewModel: MainViewModel!
        
        beforeEach {
            viewModel = MainViewModel()
        }
        
        context("더하기 버튼 누르면") {
            it("타이머 추가 얼럿을 표시한다.") {
                
            }
            context("타이머 추가 얼럿을 완료하면") {
                it("새로운 타이머를 추가한다.") {
                    
                }
            }
        }
        
    }
    
    class MainViewModel {
        
    }

}
