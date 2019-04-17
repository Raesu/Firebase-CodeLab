//
//  AppDelegate.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import Firebase

// TODO: interstitial ad unit swap
// TODO: A/B test with different reward amounts
// TODO: Front end walkthrough and Kahoot quiz

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  let window: UIWindow
  let adManager: AdManager
  
  override init() {
    window = UIWindow()
    window.makeKeyAndVisible()
    adManager = AdManager()
    super.init()
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    FirebaseConfiguration.shared.setLoggerLevel(.min)
    FirebaseApp.configure()
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    setupRemoteConfig()
    
    let navCon = UINavigationController(rootViewController: ViewController(adManager: adManager))
    window.rootViewController = navCon
    
    return true
  }
  
  func setupRemoteConfig() {
    
    let config = RemoteConfig.remoteConfig()
    config.configSettings = RemoteConfigSettings(developerModeEnabled: true)
    config.setDefaults(fromPlist: "RCDefaults")
    
    config.fetch(withExpirationDuration: 0) { (fetchStatus, error) in
      
      if let error = error {
        print("error fetching: " + error.localizedDescription)
        return
      }
      
      config.activateFetched()
      self.adManager.interstitialAdManager.adUnitID = RemoteConfigManager.interstitialAdUnitID
      self.adManager.rewardedAdManager.adUnitID = RemoteConfigManager.rewardedAdUnitID
      self.adManager.loadAds()
      
      RemoteConfigManager.logParams()
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

