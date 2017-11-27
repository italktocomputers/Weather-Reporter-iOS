//
//  MockDataSource.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/17/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation

class MockDataSource: DataAdapterProtocol {
    var reports: [StormAnnotation] = [
        StormAnnotation(
            lat: 43.184116,
            long: -71.557768,
            title: Config.title_cloudy,
            subtitle:  "Reported by Andrew Schools"
        ),
        StormAnnotation(
            lat: 43.211714,
            long: -71.517186,
            title: Config.title_cloudysunny,
            subtitle: "Reported by Jennifer Hannux"
        )
    ]
    
    var users: [User] = [
        User(userId: 1, rating: 5, otherId: "111111111111111", otherName: "Facebook", name: "Andrew Schools"),
        User(userId: 2, rating: 5, otherId: "222222222222222", otherName: "Facebook", name: "Jennifer Hannux"),
        User(userId: 3, rating: 5, otherId: "333333333333333", otherName: "Facebook", name: "Mark Dignen"),
        User(userId: 4, rating: 4, otherId: "112225232461963", otherName: "Facebook", name: "Test User")
    ]
    
    func connect() {
        
    }
    
    func getReports(time1: NSDate, time2: NSDate) -> [StormAnnotation] {
        return self.reports
    }
    
    func addReport(type: String, user: String, lat: Double, long: Double) -> StormAnnotation {
        let newReport = StormAnnotation(
            lat: lat,
            long: long,
            title: Config.title_cloudysunny,
            subtitle: "Reported by " + user
        )
        
        self.reports.append(newReport)
        
        return newReport
    }
    
    func getUser(userId: Int) -> User? {
        for x in self.users {
            if (x.userId == userId) {
                return x
            }
        }
        
        return nil;
    }
    
    func getUser(otherId: String, otherName: String) -> User? {
        for x in self.users {
            if (x.otherId == otherId && x.otherName == otherName) {
                return x
            }
        }
        
        return nil;
    }
}