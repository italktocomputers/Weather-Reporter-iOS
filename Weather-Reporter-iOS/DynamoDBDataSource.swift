//
//  DynamoDBDataSource.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 11/15/15.
//  Copyright © 2015 Andrew Schools. All rights reserved.
//

import Foundation


class DynamoDBDataSource: DataAdapterProtocol {
    
    func connect() {
        let dynamoDB = AWSDynamoDB.defaultDynamoDB()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput).continueWithBlock{ (task: AWSTask!) -> AnyObject! in
            if let error = task.error {
                print("Error occurred: \(error)")
                return nil
            }
            
            let listTablesOutput = task.result as! AWSDynamoDBListTablesOutput
            
            for tableName : AnyObject in listTablesOutput.tableNames {
                print("\(tableName)")
            }
            
            return nil
        }
    }
    
    func getReports(time1: NSDate, time2: NSDate) -> [StormAnnotation] {
        return [
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
    }
    
    func addReport(type: String, user: String, lat: Double, long: Double) -> StormAnnotation {
        return StormAnnotation(
            lat: 43.184116,
            long: -71.557768,
            title: Config.title_cloudy,
            subtitle:  "Reported by Andrew Schools"
        )
    }
    
    func getUser(userId: Int) -> User? {
        return User(userId: 1, rating: 1, otherId: "1", otherName: "", name: "")
    }
    
    func getUser(otherId: String, otherName: String) -> User? {
        return User(userId: 1, rating: 1, otherId: "1", otherName: "", name: "")
    }
}