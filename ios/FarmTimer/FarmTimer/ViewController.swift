//
//  ViewController.swift
//  FarmTimer
//
//  Created by eyemac on 15/04/2019.
//  Copyright © 2019 rollmind. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    var context: NSManagedObjectContext!

    lazy var fetchRequest: NSFetchRequest<Time> = Time.fetchRequest()
    lazy var fetchedResult: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: self.fetchRequest, managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: "com.rollmind.farmtimer.times")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTime(_:)))

        fetchedResult.delegate = self
        try! fetchedResult.performFetch()
    }

}

extension ViewController {

    @objc func addTime(_ sender: Any) {
        let alert = UIAlertController(title: "Add Time", message: nil, preferredStyle: .actionSheet)
        alert.addTextField { textField in
            textField.placeholder = "Insert timer label"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            self.addTime(title: alert.textFields?[0].text)
        }))
    }

    func addTime(title: String?) {
        guard let title = title else { return }
        let time = Time(context: context)
        time.label = title
        time.time = 0
        context.insert(time)
    }

}

extension ViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResult.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResult.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TimeCell {
            let time = fetchedResult.object(at: indexPath)
            cell.textLabel?.text = time.label
            cell.detailTextLabel?.text = time.time.description
        }
    }

}

extension ViewController: NSFetchedResultsControllerDelegate {



}
