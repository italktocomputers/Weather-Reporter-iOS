//
//  Confirm.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 9/1/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import UIKit

class ConfirmView: UIView  {
    @IBAction func submit(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("submitReport", object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2.0
        self.clipsToBounds = true
    }
    
    @IBAction func closeDialog(sender: AnyObject) {
        self.removeFromSuperview()
    }
}

