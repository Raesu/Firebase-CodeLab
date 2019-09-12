//
//  AppDelegate.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let adManager = AdManager()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    window?.makeKeyAndVisible()
    
    FirebaseConfiguration.shared.setLoggerLevel(.min)
    FirebaseApp.configure()
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    setupRemoteConfig()
    
    let navCon = UINavigationController(rootViewController: ViewController(adManager: adManager))
    window?.rootViewController = navCon
    
    return true
  }
  
  func setupRemoteConfig() {
    
    let config = RemoteConfig.remoteConfig()
    config.setDefaults(fromPlist: "RCDefaults")
    
    config.fetch(withExpirationDuration: 0) { (fetchStatus, error) in
      
      if let error = error {
        print("error fetching: " + error.localizedDescription)
        return
      }
      
      config.activate(completionHandler: { (error) in
        self.adManager.loadAds()
        RemoteConfigManager.logParams()
      })
    }
    
    InstanceID.instanceID().instanceID { (result, error) in
      if let error = error {
        print("Error fetching remote instance ID: \(error)")
      } else if let result = result {
        print("RYSU Remote instance ID token: \(result.token)")
      }
    }
    
  }

}

