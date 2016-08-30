//
//  ViewController.swift
//  UITableView
//
//  Created by Sebastian Boldt on 05.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

/**
 SubView vs TableViewController
 - TableView automatically created
 - Data Source and delegate will be set 
 - viewWillAppear - clears selection, flashes scroll indicators
 - implements setEditing(_:aniamted) to toggle edit mode of table
 - static cells
 **/

class ViewController: UIViewController {
    var data = [["a","b","c"],["d","e","f"]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.reloadData()
        self.tableView.allowsSelectionDuringEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
        
        tableView.beginUpdates()
        for (index,sectionData) in self.data.enumerated() {
            let indexPath = NSIndexPath(row: sectionData.count, section: index)
            if editing {
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            } else {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
        tableView.endUpdates()
    }
}

// MARK: UITableViewDelegate - Events and Customization

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard isEditing == true else {
            return indexPath
        }
        
        let sectionData = self.data[indexPath.section]
        if indexPath.row == sectionData.count {
          return indexPath
        } else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let sectionData = self.data[indexPath.section]
        if indexPath.row == sectionData.count {
            return .insert
        } else {
            return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if isEditing {
            self.tableView.deselectRow(at: indexPath, animated: true)
            let sectionData = self.data[indexPath.section]
            if sectionData.count == indexPath.row {
                self.data[indexPath.section].append("added")
                self.tableView.insertRows(at: [indexPath], with: .bottom)
            }
        } else {
            let alertController = UIAlertController(title: "Selected", message: "\(indexPath.section),\(indexPath.row)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {action in
                alertController.dismiss(animated: true, completion: nil)
            })
            
            let deleteAction = UIAlertAction(title: "Delete", style:.destructive, handler: {
                action in
                ///1. Delete from DataSource
                self.data[indexPath.section].remove(at: indexPath.row)
                ///2. Delete Cell from TableView
                self.tableView.deleteRows(at: [indexPath], with: .bottom)
            })
            
            alertController.addAction(action)
            alertController.addAction(deleteAction)
            
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.row >= self.data[proposedDestinationIndexPath.section].count {
            return NSIndexPath(item: self.data[proposedDestinationIndexPath.section].count-1, section:proposedDestinationIndexPath.section) as IndexPath
        } else {
           return proposedDestinationIndexPath
        }
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = self.data[sourceIndexPath.section][sourceIndexPath.row] // Store item to remove
        self.data[sourceIndexPath.section].remove(at: sourceIndexPath.row) // Remove old
        self.data[destinationIndexPath.section].insert(temp, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let sectionData = self.data[indexPath.section]
        if indexPath.row < sectionData.count && self.tableView.isEditing {
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ///1. Delete from DataSource
            self.data[indexPath.section].remove(at: indexPath.row)
            ///2. Delete Cell from TableView
            self.tableView.deleteRows(at: [indexPath], with: .bottom)
        } else if editingStyle == .insert {
            self.data[indexPath.section].append("added")
            self.tableView.insertRows(at: [indexPath], with: .bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        if indexPath.row > self.data.count && isEditing {
            cell.textLabel?.text = "Add"
            return cell
        } else {
            cell.textLabel?.text = self.data[indexPath.section][indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adjustment = isEditing ? 1 : 0
        return self.data[section].count + adjustment
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section: \(section)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
}
