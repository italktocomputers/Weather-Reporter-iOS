//
//  IDataAdapter.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/17/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation

protocol DataAdapterProtocol {
    func connect()
    func getReports(time1: NSDate, time2: NSDate) -> [StormAnnotation]
    func addReport(type: String, user: String, lat: Double, long: Double) -> StormAnnotation
    func getUser(userId: Int) -> User?
    func getUser(otherId: String, otherName: String) -> User?
}