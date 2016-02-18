//
//  PPTTrailsListViewController.swift
//  Trailer
//
//  Created by PragmaPilot on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit
import CoreData

class PPTTrailsListViewController: UITableViewController, PPTTrailsListViewInterface {

    // MARK - Properties

    private var trails: [Trail]?
    
    // MARK - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK - UITableViewController
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.trails?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = self.trails![indexPath.row].trail_description         // TODO Refactor: Move cell data binding
        
        return cell
    }
    
    // MARK - PPTTrailsListViewInterface
    
    func showNoContentView() {
        // TODO
    }
    
    func showTrailsList(trails: [Trail]) {
        self.trails = trails
        reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK - Private
    
    private func configureView() {
        // Show no empty cells
        tableView.tableFooterView = UIView()
    }
}

