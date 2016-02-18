//
//  PPTTrailsListInteractor.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit

class PPTTrailsListInteractor: NSObject {

    let dataManager: PPTTrailsDataManager
    var output: PPTTrailsListInteractorOutput?
    
    init(dataManager: PPTTrailsDataManager) {
        self.dataManager = dataManager
    }
    
    func findTrails(){
        [self.dataManager.trails { trails in
            self.output?.foundTrails(trails)
        }]
    }
}
