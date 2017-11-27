//
//  User.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 9/1/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation

class User {
    var userId: Int
    var rating: Int
    var otherId: String
    var otherName: String
    var name: String
    
    init(userId: Int, rating: Int, otherId: String, otherName: String, name: String) {
        self.userId = userId
        self.rating = rating
        self.otherId = otherId
        self.otherName = otherName
        self.name = name
    }
}