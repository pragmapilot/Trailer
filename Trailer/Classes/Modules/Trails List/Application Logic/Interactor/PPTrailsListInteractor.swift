//
//  PPTrailsListInteractor.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit

class PPTrailsListInteractor: NSObject {

    var dataManager: PPTTrailsDataManager
    
    init(dataManager: PPTTrailsDataManager) {
        self.dataManager = dataManager
    }
}
