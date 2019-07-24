//
//  Constants.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import FirebaseRemoteConfig

class RemoteConfigManager {
  
  static let rewardedButtonTitle = RemoteConfig.remoteConfig()["rewardedButtonTitle"].stringValue ?? ""
  static let rewardedAdUnitID = RemoteConfig.remoteConfig()["rewardedAdUnitID"].stringValue ?? ""
  static let interstitialAdUnitID = RemoteConfig.remoteConfig()["interstitialAdUnitID"].stringValue ?? ""
  
  static func logParams() {
    print("RYSU rewardedAdUnitID: " + rewardedAdUnitID)
    print("RYSU interstitialAdUnitID: " + interstitialAdUnitID)
    print("RYSU rewardedButtonTitle: " + rewardedButtonTitle)
  }
}
