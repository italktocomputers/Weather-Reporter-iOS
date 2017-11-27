//
//  StormAnnotation.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/17/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation
import MapKit

class StormAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(lat: Double, long: Double, title: String, subtitle: String) {
        let lat = CLLocationDegrees(lat)
        let long = CLLocationDegrees(long)
        
        let coordinate = CLLocationCoordinate2D(latitude: lat,
                                               longitude: long)
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}