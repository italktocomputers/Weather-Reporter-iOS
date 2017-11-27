//
//  IceReport.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 9/1/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation
import UIKit

class IceReport: Report {
    var type: Ice
    
    init(date: NSDate, user: User, photos: [UIImageView], type: Ice) {
        self.type = type
        super.init(date: date, user: user, photos: photos)
    }
}