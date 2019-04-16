//
//  RewardedAdManager.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import GoogleMobileAds

class RewardedAdManager: BaseAdManager {
  
  typealias RewardedCompletion = (Int, String) -> Void
  var adUnitID = "ca-app-pub-6562905997824789/6785143588"
  private var completionHandler: RewardedCompletion?
  
  var reward: (Int, String) = (0, "No reward")
  
  override var isReady: Bool {
    return GADRewardBasedVideoAd.sharedInstance().isReady
  }
  
  override func loadAd() {
    GADRewardBasedVideoAd.sharedInstance().delegate = self
    GADRewardBasedVideoAd.sharedInstance().load(request(), withAdUnitID: adUnitID)
  }
  
  func showAd(fromRoot root: UIViewController, withCompletion completionHandler: @escaping RewardedCompletion) {
    GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: root)
    self.completionHandler = completionHandler
  }
  
}


extension RewardedAdManager: GADRewardBasedVideoAdDelegate {
  
  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
    print("rewarded \(reward.amount) of \(reward.type)")
    self.reward = (reward.amount.intValue, reward.type)
  }
  
  func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    GADRewardBasedVideoAd.sharedInstance().load(request(), withAdUnitID: adUnitID)
    if let handler = completionHandler {
      handler(reward.0, reward.1)
      self.completionHandler = nil
      self.reward = (0, "No reward")
    }
  }
  
  func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    print("rewarded ad loaded")
  }
  
  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
    print("failed to load with error: " + error.localizedDescription)
  }
  
}
