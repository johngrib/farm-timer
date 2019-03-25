//
//  ViewController.swift
//  FarmTimer
//
//  Created by eyetin on 14/03/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit

class TimerListController: UIViewController {

    lazy var listViewModel: TimerListViewModel = .init()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        listViewModel.delegate = self
    }
    
}

extension TimerListController: UITableViewDataSource {
    
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

extension TimerListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TimerCell else { return }
        guard let item = listViewModel.itemAt(row: indexPath.row, section: indexPath.section) else { return }
        cell.titleLabel.text = item.title
    }
    
}

extension TimerListController: TimerListViewModelDelegate {
    
    func listViewAdded(_ model: TimerListViewModel) {
        tableView.reloadData()
    }
    
}
