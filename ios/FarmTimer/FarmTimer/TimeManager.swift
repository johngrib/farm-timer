//
//  Timer.swift
//  FarmTimer
//
//  Created by eyemac on 09/05/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation
import CoreData

final class TimeManager {

    static let shared: TimeManager = TimeManager()

    private var timer: Timer?

    private var time: Time?

    private init() {}

    @objc func increament() {
        guard let time = time else { return }
        time.time += 1
    }

    func start(for time: Time) {
        timer?.invalidate()
        if self.time?.isEqual(time) == true {
            self.timer?.invalidate()
            self.timer = nil
            self.time = nil
            return
        }
        self.time = time
        let timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(increament), userInfo: self, repeats: true)
        self.timer = timer
    }

    func stop(for time: Time) {
        if self.time?.isEqual(time) == true, self.timer?.isValid == true {
            self.timer?.invalidate()
            self.timer = nil
            self.time = nil
        }
    }

}
