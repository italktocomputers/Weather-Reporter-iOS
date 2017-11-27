//
//  IceView.swift
//  Weather-Reporter-iOS
//
//  Created by Andrew Schools on 9/1/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import UIKit

class IceView: UIView, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var picker: UIPickerView!
    var ice = [String]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2.0
        self.clipsToBounds = true
        
        self.ice.append("Sleet")
        self.ice.append("Freezing Rain")
        self.ice.append("Hail")
        self.ice.append("Graupel")
    }
    
    override func awakeFromNib() {
        picker.dataSource = self
        picker.delegate = self
    }
    
    @IBAction func closeDialog(sender: AnyObject) {
        self.removeFromSuperview()
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ice.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ice[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var tView = view as? UILabel
        
        if (view == nil) {
            tView = UILabel()
            tView!.font = UIFont(name:"American Typewriter", size:17)
            tView!.numberOfLines = 10
            tView!.textAlignment = NSTextAlignment.Center
        }
        
        tView!.text = self.ice[row]
        return tView!
    }
}
