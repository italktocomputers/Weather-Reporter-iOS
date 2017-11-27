//
//  UserRating.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 11/14/15.
//  Copyright © 2015 Andrew Schools. All rights reserved.
//

import Foundation

class UserRating {
    var rating: Int
    var user: User
    var owner: User
    var feedback: String
    
    init(rating: Int, user:User, owner: User, feedback: String) {
        self.rating = rating
        self.user = user
        self.owner = owner
        self.feedback = feedback
    }
    
}