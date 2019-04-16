//
//  AdManager.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

class AdManager {
  
  let interstitialAdManager = InterstitialAdManager()
  let rewardedAdManager = RewardedAdManager()
  
  func loadAds() {
    interstitialAdManager.loadAd()
    rewardedAdManager.loadAd()
  }
}
