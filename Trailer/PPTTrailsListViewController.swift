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

    // TODO Refactor
    var trails: Array<Trail>?
    // TODO Refactor
    var persistenceManager: PPTPersistenceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO Refactor
        persistenceManager = PPTPersistenceManager()
        let trail1 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: self.persistenceManager!.managedObjectContext) as! Trail
        let trail2 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: self.persistenceManager!.managedObjectContext) as! Trail
        
        trail1.trail_description = "My first trail"
        trail2.trail_description = "My second trail"
     
        self.trails = [trail1,trail2]
        
        // Don't show empty cells...
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the count of the number of rows in the table
        return (self.trails?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        // TODO Refactor: Move cell data binding
        cell.textLabel?.text = self.trails![indexPath.row].trail_description
        
        return cell
    }
}

