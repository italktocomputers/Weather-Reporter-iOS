//
//  LoginController.swift
//  Storm-Reporter-iOS
//
//  Created by Andrew Schools on 8/22/15.
//  Copyright (c) 2015 Andrew Schools. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKCoreKit.FBSDKAccessToken

class LoginController: UIViewController, FBSDKLoginButtonDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            // User is NOT logged-in so we will show FaceBook login button
            let loginButton = FBSDKLoginButton()
            loginButton.center = self.view.center
            self.view.addSubview(loginButton)
            loginButton.delegate = self
        } else {
            // User is already logged-in so redirect them to Map Controller
            sendToApp()
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton, didCompleteWithResult result: FBSDKLoginManagerLoginResult, error: NSError) {
        print(FBSDKAccessToken.currentAccessToken())
        if FBSDKAccessToken.currentAccessToken() != nil {
            
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath:  "me", parameters: nil)
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                if ((error) != nil) {
                    // Process error
                    print("Error: \(error)")
                } else {
                    Config.userid = (result.valueForKey("id") as? String)!
                    Config.username = (result.valueForKey("name") as? String)!
                    //Config.useremail = (result.valueForKey("email") as? String)!
                }
            })
            
            sendToApp()
        }
    }
    
    func loginButtonDidLogOut(loginButton:FBSDKLoginButton) {
        print("Logged out!")
    }
    
    func sendToApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let controller = storyboard.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
