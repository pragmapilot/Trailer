//
//  PPTTrailsDataManager.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit
import CoreData // TODO Remove

class PPTTrailsDataManager: NSObject {
    
    // MARK - Properties
    
    var persistenceManager: PPTPersistenceManager?
    
    lazy var trailsEntityName: String = {
        // TODO Refactor to Utility class?
        return NSStringFromClass(Trail).componentsSeparatedByString(".").last!
    }()
    
    // MARK - Init
    
    override init() {
        super.init()
        setData()
    }
    
    // MARK - Public methods
    
    func trails(completion:([Trail]->Void)!) {
        persistenceManager?.fetchEntriesForEntityWithName(trailsEntityName, predicate: nil, sortDescriptors: nil, completionBlock: { entries in
            let trails = self.trailsFromDataStoreEntries(entries)
            completion(trails)
        })
    }
    
    // MARK - Private methods
    
    private func trailsFromDataStoreEntries(entries: [AnyObject]) -> [Trail] {
        var trails = [Trail]()
        
        for managedEntry in entries {
            let trail = Trail() // TODO Convert to viewModel
            trails.append(trail)
        }
        
        return trails
    }
    
    // TODO REMOVE
    private func setData(){
        if let thePersistenceManger = persistenceManager {
            thePersistenceManger.fetchEntriesForEntityWithName(trailsEntityName, predicate: nil, sortDescriptors: nil, completionBlock: { entries in
                
                if entries.count == 0 {
                    let trail1 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: thePersistenceManger.managedObjectContext) as! Trail
                    let trail2 = NSEntityDescription.insertNewObjectForEntityForName("Trail", inManagedObjectContext: thePersistenceManger.managedObjectContext) as! Trail
                    
                    trail1.trail_description = "My first trail"
                    trail2.trail_description = "My second trail"
                    
                    thePersistenceManger.saveContext()
                }
            })
        }
    }
}
