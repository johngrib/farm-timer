//
//  TimerListController+.swift
//  FarmTimer
//
//  Created by eyemac on 25/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

extension TimerListController: TimerListViewModelDelegate {
    
    func bindTimerListViewModel() {
        self.listViewModel.delegate = self
    }
    
    func listViewAdded(_ model: TimerListViewModel) {
        tableView.reloadData()
    }
    
}
