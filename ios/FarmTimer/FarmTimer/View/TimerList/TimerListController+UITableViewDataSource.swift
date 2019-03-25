//
//  TimerListController+UITableViewDataSource.swift
//  FarmTimer
//
//  Created by eyemac on 25/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

extension TimerListController: UITableViewDataSource {
    
    func setupTableViewDataSource() {
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.numberOfItems(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
