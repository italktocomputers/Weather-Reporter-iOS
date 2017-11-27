//
//  Report.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/23/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation
import UIKit

class Report {
    var date: NSDate
    var user: User
    var photos: [UIImageView]
    
    init(date: NSDate, user: User, photos: [UIImageView]) {
        self.date = date
        self.user = user
        self.photos = photos
    }
}