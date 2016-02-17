//
//  PPTTrailsListViewController.swift
//  Trailer
//
//  Created by PragmaPilot on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit
import CoreData

class PPTTrailsListViewController: UITableViewController {

    private var trails: Array<Trail>?     // TODO Refactor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()           // TODO Remove
        configureView()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.trails?.count)!     // TODO Refactor
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = self.trails![indexPath.row].trail_description         // TODO Refactor: Move cell data binding
        
        return cell
    }
    
    private func configureView() {
        // Show no empty cells
        tableView.tableFooterView = UIView()
    }
    
    private func setData(){
        let persistenceManager = PPTPersistenceManager()
        let trail1 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: persistenceManager.managedObjectContext) as! Trail
        let trail2 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: persistenceManager.managedObjectContext) as! Trail
        
        trail1.trail_description = "My first trail"
        trail2.trail_description = "My second trail"
        
        self.trails = [trail1,trail2]
    }
}

