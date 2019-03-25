//
//  TimerListController+UITableViewDelegate.swift
//  FarmTimer
//
//  Created by eyemac on 25/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

extension TimerListController: UITableViewDelegate {
    
    func setupTableViewDelegate() {
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TimerCell else { return }
        guard let item = listViewModel.itemAt(row: indexPath.row, section: indexPath.section) else { return }
        cell.titleLabel.text = item.title
    }
    
}
