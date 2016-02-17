//
//  Trail+CoreDataProperties.swift
//  Trailer
//
//  Created by PragmaPilot on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Trail {

    @NSManaged var trail_description: String?
    @NSManaged var fixes: NSSet?

}
