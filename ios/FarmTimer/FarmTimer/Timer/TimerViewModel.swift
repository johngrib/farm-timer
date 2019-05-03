//
//  TimerViewModel.swift
//  FarmTimer
//
//  Created by eyemac on 19/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import Foundation

class TimerViewModel {

    enum Life {
        case live
        case dead
    }

    let title: String
    let start: UInt
    let end: UInt?

    var increased: UInt = 0

    var current: UInt { return start + increased }

    private var refreshHandler: () -> Void = {}

    var life: Life {
        return end.flatMap({ end -> Life in
            if current < end {
                return .live
            }
            return .dead
        }) ?? .live
    }

    init(title: String, start: UInt = 0, end: UInt? = nil) {
        self.title = title
        self.start = start
        self.end = end
    }

    var timeString: String {
        var time = current
        let seconds = time % 60
        time -= seconds
        time /= 60
        let minutes = time % 60
        time -= minutes
        time /= 60
        let hours = time
        return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    }

    var timer: DispatchSourceTimer?
    func toggle() {
        let timer = DispatchSource.makeTimerSource(flags: .strict, queue: DispatchQueue.global(qos: .userInteractive))
        timer.schedule(deadline: .now(), repeating: 1.0, leeway: .nanoseconds(0))
        timer.setEventHandler {
            DispatchQueue.main.async {
                self.increased += 1
                self.refreshHandler()
            }
        }
        timer.resume()
        self.timer?.cancel()
        self.timer = timer
    }

    func refresh(_ refreshHandler: @escaping () -> Void) {
        self.refreshHandler = refreshHandler
    }
}

extension TimerViewModel: Hashable {
    
    static func == (lhs: TimerViewModel, rhs: TimerViewModel) -> Bool {
        return lhs.title == rhs.title
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }

}
