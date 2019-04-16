//
//  AppDelegate.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import Firebase

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
    adManager.interstitialAdManager.loadAd()
    adManager.rewardedAdManager.loadAd()
    
    let config = RemoteConfig.remoteConfig()
    config.configSettings = RemoteConfigSettings(developerModeEnabled: true)
    config.setDefaults(fromPlist: "RCDefaults")
    
    let navCon = UINavigationController(rootViewController: ViewController(adManager: adManager))
    window.rootViewController = navCon
    
    return true
  }

}

