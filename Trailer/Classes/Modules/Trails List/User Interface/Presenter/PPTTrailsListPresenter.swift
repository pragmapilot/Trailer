//
//  PPTTrailsListPresenter.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 17/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import UIKit

class PPTTrailsListPresenter: NSObject, PPTTrailsListInteractorOutput {
    var interactor: PPTTrailsListInteractor?
    var userInterface: PPTTrailsListViewInterface?

    // MARK - PPTTrailsListInteractorOutput
    
    func foundTrails(trails:[Trail]){
        if let ui = userInterface {
            if trails.count > 0 {
                ui.showTrailsList(trails)
            }
            else {
                ui.showNoContentView()
            }
        }
    }
}
