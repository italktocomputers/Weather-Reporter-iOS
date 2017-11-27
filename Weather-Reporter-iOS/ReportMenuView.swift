//
//  ReportMenuViewController.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 8/30/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import UIKit

class ReportMenuView: UIView {
    @IBOutlet weak var menuNavBar: UINavigationBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2.0
        self.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        self.scrollView.contentSize = CGSize(width: 300, height: 650)
    }
    
    @IBAction func closeBtnClick(sender: AnyObject) {
        self.removeFromSuperview()
    }
    
    @IBAction func sunnyBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportSunny", object: nil)
    }
    
    @IBAction func cloudyBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportCloudy", object: nil)
    }
    
    @IBAction func rainBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportRain", object: nil)
    }
    
    @IBAction func thunderstormBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportThunderstorm", object: nil)
    }
    
    @IBAction func snowBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportSnow", object: nil)
    }
    
    @IBAction func fogBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportFog", object: nil)
    }
    
    @IBAction func iceBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportIce", object: nil)
    }
    
    @IBAction func tornadoBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportTornado", object: nil)
    }
    
    @IBAction func tempBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportTemp", object: nil)
    }
    
    @IBAction func damageBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportDamage", object: nil)
    }
    
    @IBAction func earthquakeBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportEarthquake", object: nil)
    }
    
    @IBAction func floodBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportFlood", object: nil)
    }
    
    @IBAction func windyBtnClick(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("reportWindy", object: nil)
    }
    
}