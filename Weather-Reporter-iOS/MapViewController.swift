//
//  ViewController.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 8/29/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import UIKit
import MapKit
import FBSDKCoreKit.FBSDKAccessToken

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var map: MKMapView!
    
    var dialogVisable = false
    var dialog: UIView?
    var locationManager = CLLocationManager()
    
    var reportType: String = ""
    var typeOfIce: Ice = Ice.FreezingRain
    var temperature: Int = 0
    
    var long: Double = 0.0
    var lat: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportSunny:", name: "reportSunny", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportCloudy:", name: "reportCloudy", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportRain:", name: "reportRain", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportThunderstorm:", name: "reportThunderstorm", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportSnow:", name: "reportSnow", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportFog:", name: "reportFog", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportIce:", name: "reportIce", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportTornado:", name: "reportTornado", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportTemp:", name: "reportTemp", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportDamage:", name: "reportDamage", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportEarthquake:", name: "reportEarthquake", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportFlood:", name: "reportFlood", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportWindy:", name: "reportWindy", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showConfirmation:", name: "showConfirmation", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "submitReport", name: "submitReport", object: nil)
        
        print(FBSDKAccessToken.currentAccessToken())
        
        // Get latest reports from datasource
        let reports = Factory.db_conn().getReports(NSDate(), time2: NSDate())
        
        if Config.show_my_location == true {
            // We need to know where user is so we can zoom and center
            // map to their location.
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
            self.map.showsUserLocation = true
        }
        
        // Add report pins to map
        // todo: We need to only fetch those in current map location
        for report in reports {
            self.map.addAnnotation(report)
        }
        
        self.map.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "test"
        var image = ""
        
        switch annotation.title! {
        case Config.title_thunderstorm? :
            image = Config.icon_thunderstorm
            
        case Config.title_snowy? :
            image = Config.icon_snowy
            
        case Config.title_rainy? :
            image = Config.icon_rainy
            
        case Config.title_windy? :
            image = Config.icon_windy
            
        case Config.title_tornado? :
            image = Config.icon_tornado
            
        case Config.title_cloudy? :
            image = Config.icon_cloudy
            
        case Config.title_cloudysunny? :
            image = Config.icon_cloudysunny
            
        default :
            image = Config.icon_current_loc
        }
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView?.image = UIImage(named: image)
            anView?.canShowCallout = true
        } else {
            // We are re-using a view so update its annotation reference...
            anView?.annotation = annotation
        }
        
        return anView
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // todo: We should only do something if they have moved more than x miles...
        
        let location = locations.last as CLLocation!
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: Config.map_zoom, longitudeDelta: Config.map_zoom))
        
        self.map.setRegion(region, animated: true)
        
        self.long = location.coordinate.longitude
        self.lat = location.coordinate.latitude
    }
    
    @IBAction func menuBtnClick(sender: AnyObject) {
        self.showDialog("ReportMenu", width: 300, height: 400)
    }
    
    func showDialog(name:String, width: Int=300, height: Int=365) {
        self.hideDialog()
        
        self.dialog = NSBundle.mainBundle().loadNibNamed(name, owner: self, options: nil)[0] as? UIView
        self.dialog?.hidden = false
        self.dialog?.frame = CGRect(origin: CGPoint(), size: CGSize(width: width, height: height))
        self.dialog?.center = CGPointMake(self.view.frame.size.width  / 2, self.view.frame.size.height / 2)
        
        self.view.addSubview(self.dialog!)
    }
    
    func hideDialog() {
        self.dialog?.removeFromSuperview()
    }
    
    func reportSunny(notification: NSNotification) {
        print("Report Sunny")
        reportType = Config.title_sunny
        showConfirmation()
    }
    
    func reportCloudy(notification: NSNotification) {
        print("Report Cloudy")
        reportType = Config.title_cloudy
        showConfirmation()
    }
    
    func reportRain(notification: NSNotification) {
        print("Report Rain")
        reportType = Config.title_rainy
        showConfirmation()
    }
    
    func reportThunderstorm(notification: NSNotification) {
        print("Report Thunderstorm")
        reportType = Config.title_thunderstorm
        showConfirmation()
    }
    
    func reportSnow(notification: NSNotification) {
        print("Report Snow")
        reportType = Config.title_snowy
        showConfirmation()
    }
    
    func reportFog(notification: NSNotification) {
        print("Report Fog")
        reportType = Config.title_foggy
        showConfirmation()
    }
    
    func reportIce(notification: NSNotification) {
        print("Report Ice")
        reportType = Config.title_icy
        self.showDialog("Ice")
    }
    
    func reportTornado(notification: NSNotification) {
        print("Report Tornado")
        reportType = Config.title_tornado
        showConfirmation()
    }
    
    func reportTemp(notification: NSNotification) {
        print("Report Temp")
        reportType = Config.title_temperature
        self.showDialog("Temperature")
    }
    
    func reportDamage(notification: NSNotification) {
        print("Report Damage")
        reportType = Config.title_damage
        showConfirmation()
    }
    
    func reportEarthquake(notification: NSNotification) {
        print("Report Earthquake")
        reportType = Config.title_earthquake
        showConfirmation()
    }
    
    func reportFlood(notification: NSNotification) {
        print("Report Flood")
        reportType = Config.title_flood
        showConfirmation()
    }
    
    func reportWindy(notification: NSNotification) {
        print("Report Windy")
        reportType = Config.title_windy
        showConfirmation()
    }
    
    func showConfirmation() {
        self.showDialog("Confirm")
    }
    
    func submitReport() {
        let report = Factory.db_conn().addReport("",user: Config.username, lat: self.lat, long: self.long)
        self.map.addAnnotation(report)
        self.hideDialog()
    }
}

