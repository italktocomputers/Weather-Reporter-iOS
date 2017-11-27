//
//  TemperatureReport.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 9/1/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation
import UIKit

class TemperatureReport: Report {
    var degree: Int
    
    init(date: NSDate, user: User, photos: [UIImageView], degree: Int) {
        self.degree = degree
        super.init(date: date, user: user, photos: photos)
    }
}