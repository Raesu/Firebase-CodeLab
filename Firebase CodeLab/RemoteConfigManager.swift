//
//  Constants.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import FirebaseRemoteConfig

class RemoteConfigManager {
  
  enum Params: String {
    case rewardedButtonTitle, rewardedAdUnitID, interstitialAdUnitID
  }
  
  static let rewardedButtonTitle = RemoteConfig.remoteConfig()[Params.rewardedButtonTitle.rawValue].stringValue ?? ""
  static let rewardedAdUnitID = RemoteConfig.remoteConfig()[Params.rewardedAdUnitID.rawValue].stringValue ?? ""
  static let interstitialAdUnitID = RemoteConfig.remoteConfig()[Params.interstitialAdUnitID.rawValue].stringValue ?? ""
  
  static func logParams() {
    print("RYSU rewardedAdUnitID: " + rewardedAdUnitID)
    print("RYSU interstitialAdUnitID: " + interstitialAdUnitID)
    print("RYSU rewardedButtonTitle: " + rewardedButtonTitle)
  }
}
