//
//  DataAdapter.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/17/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//
// This class is used as an abstraction layer to the datasource.  
// Every datasource must implement the DataAdapterProtocol protocol.
//

import Foundation

class DataAdapter: DataAdapterProtocol {
    var dataSource: DataAdapterProtocol
    
    init(dataSource: DataAdapterProtocol) {
        self.dataSource = dataSource
    }
    
    func connect() {
        self.dataSource.connect()
    }
    
    func getReports(time1: NSDate, time2: NSDate) -> [StormAnnotation] {
        return self.dataSource.getReports(time1, time2:time2)
    }
    
    func addReport(type: String, user: String, lat: Double, long: Double) -> StormAnnotation{
        return self.dataSource.addReport(type, user:user, lat: lat, long: long)
    }
    
    func getUser(userId: Int) -> User? {
        return self.dataSource.getUser(userId)
    }
    
    func getUser(otherId: String, otherName: String) -> User? {
        return self.dataSource.getUser(otherId, otherName: otherName)
    }
}