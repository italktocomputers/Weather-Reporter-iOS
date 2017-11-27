//
//  Factory.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/20/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation

class Factory {
    static var adapter: DataAdapter?
    
    static func db_conn() -> DataAdapter {
        if (self.adapter == nil) {
            if (Config.db_type == "Mock") {
                let datasource = MockDataSource()
                self.adapter = DataAdapter(dataSource: datasource)
            }
        }
        
        return adapter!
    }
}