//
//  TimerListViewModel.swift
//  FarmTimer
//
//  Created by eyetin on 17/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

class TimerListViewModel {
    
    weak var delegate: TimerListViewModelDelegate?
    private(set) lazy var timerGroup: TimerGroup = TimerGroup()
    
    var items: [TimerItem] {
        return timerGroup.items
    }
    
}

protocol TimerListViewModelDelegate: class {
    
    func listViewAdded(_ model: TimerListViewModel)
    
}

protocol TimerListItemContainable {
    var numberOfSections: Int { get }
    func numberOfItems(at section: Int) -> Int
    func itemAt(row: Int, section: Int) -> TimerItem?
}

extension TimerListViewModel: TimerListItemContainable {
    
    var numberOfSections: Int { return items.isEmpty ? 0 : 1 }
    
    func numberOfItems(at section: Int) -> Int {
        return items.count
    }
    
    func itemAt(row: Int, section: Int) -> TimerItem? {
        if section == 0 {
            return items[row]
        }
        return nil
    }
    
}

protocol TimerListAddable {
    func add(_ item: TimerItem)
}

extension TimerListViewModel: TimerListAddable {
    
    func add(_ item: TimerItem) {
        timerGroup.add(item: item)
        delegate?.listViewAdded(self)
    }
    
}
