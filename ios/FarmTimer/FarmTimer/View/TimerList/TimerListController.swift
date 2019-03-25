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
        
        setupTableViewDelegate()
        setupTableViewDataSource()
        bindTimerListViewModel()
    }
    
    func setupUI() {
        tableView.tableFooterView = UIView()
    }
}
