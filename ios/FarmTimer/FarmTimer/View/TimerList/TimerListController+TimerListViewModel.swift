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
    
    @objc func clickAddItem(_ sender: Any) {
        showAddAlert { item in
            self.listViewModel.add(item)
        }
    }
    
    func showAddAlert(_ completionHandler: @escaping (TimerItem) -> Void) {
        let addActionAlert = UIAlertController(title: "Insert Timer", message: nil, preferredStyle: .alert)
        addActionAlert.addTextField { textField in
            textField.placeholder = "Input title"
        }
        addActionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        addActionAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            guard let textField: UITextField = addActionAlert.textFields?[0] else { return }
            guard let text: String = textField.text, text.isEmpty == false else { return }
            let item = TimerItem(title: text)
            completionHandler(item)
        }))
        present(addActionAlert, animated: true, completion: nil)
    }
    
    func listViewAdded(_ model: TimerListViewModel) {
        tableView.reloadData()
    }
    
}
