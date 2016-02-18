//
//  PPTTrailsListViewInterface.swift
//  Trailer
//
//  Created by Rodrigo Goncalves on 18/02/2016.
//  Copyright © 2016 PragmaPilot. All rights reserved.
//

import Foundation

protocol PPTTrailsListViewInterface {
    func showNoContentView();
    func showTrailsList(trails: [Trail]); // TODO evaluate if it's more appropriate to have a more specific data type
    func reloadData();
}