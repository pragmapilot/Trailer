//
//  PPTTrailsDataManager.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit

class PPTTrailsDataManager: NSObject {
    
    var persistenceManager: PPTPersistenceManager?
    
    lazy var trailsEntityName: String = {
        // TODO Refactor to Utility class?
        return NSStringFromClass(Trail).componentsSeparatedByString(".").last!
    }()
    
    func trails(completion:([Trail]->Void)!) {
        persistenceManager?.fetchEntriesForEntityWithName(trailsEntityName, predicate: nil, sortDescriptors: nil, completionBlock: { entries in
            let trails = self.trailsFromDataStoreEntries(entries)
            completion(trails)
        })
    }
    
    private func trailsFromDataStoreEntries(entries: [AnyObject]) -> [Trail] {
        var trails = [Trail]()
        
        for managedEntry in entries {
            let trail = Trail() // TODO Convert to viewModel
            trails.append(trail)
        }
        
        return trails
    }
}
