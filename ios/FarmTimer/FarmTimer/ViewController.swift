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

    lazy var fetchRequest: NSFetchRequest<Time> = {
        let request: NSFetchRequest<Time> = Time.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "createdate", ascending: true)]
        return request
    }()
    lazy var fetchedResult: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: self.fetchRequest, managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: "com.rollmind.farmtimer.times")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Farm Timer"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTime(_:)))

        fetchedResult.delegate = self
        try! fetchedResult.performFetch()

        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }

}

extension ViewController {

    @objc func addTime(_ sender: Any) {
        let alert = UIAlertController(title: "Add Time", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Insert timer label"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            self.addTime(title: alert.textFields?[0].text)
        }))
        present(alert, animated: true, completion: nil)
    }

    func addTime(title: String?) {
        guard let title = title else { return }
        let time = Time(context: context)
        time.label = title
        time.time = 0
        time.createdate = Date()
        fetchedResult.managedObjectContext.insert(time)
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

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [
            UITableViewRowAction(style: .destructive, title: "delete", handler: { (_, indexPath) in
                let time = self.fetchedResult.object(at: indexPath)
                TimeManager.shared.stop(for: time)
                self.fetchedResult.managedObjectContext.delete(time)
            }),
            UITableViewRowAction(style: .normal, title: "reset", handler: { (_, indexPath) in
                let time = self.fetchedResult.object(at: indexPath)
                TimeManager.shared.stop(for: time)
                time.time = 0
            })
        ]
    }

    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let time = self.fetchedResult.object(at: indexPath)
        TimeManager.shared.stop(for: time)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TimeCell {
            let time = fetchedResult.object(at: indexPath)
            cell.textLabel?.text = time.label
            cell.detailTextLabel?.text = format(from: time.time)
        }
    }

    func format(from time: TimeInterval) -> String {
        var timeValue = UInt64(time)
        let seconds = timeValue % 60
        timeValue /= 60
        let minutes = timeValue % 60
        timeValue /= 60
        let hours = timeValue % 24
        timeValue /= 24
        var times: [String] = []
        if timeValue > 0 {
            times.append("\(timeValue)일")
        }
        if times.count > 0 || hours > 0 {
            times.append("\(hours)시간")
        }
        if times.count > 0 || minutes > 0 {
            times.append("\(minutes)분")
        }
        times.append("\(seconds)초")
        return times.joined(separator: " ")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            DispatchQueue.main.async {
                let time = self.fetchedResult.object(at: indexPath)
                TimeManager.shared.start(for: time)
            }
        }
    }

}

extension ViewController: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        let olds: [IndexPath] = indexPath.flatMap({ [$0] }) ?? []
        let news: [IndexPath] = newIndexPath.flatMap({ [$0] }) ?? []
        switch type {
        case .insert:
            tableView.insertRows(at: news, with: .fade)
        case .delete:
            tableView.deleteRows(at: olds, with: .fade)
        case .update:
            tableView.reloadRows(at: olds, with: .none)
        case .move:
            tableView.moveRow(at: olds[0], to: news[0])
        @unknown default:
            break
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

}
