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
//  var adUnitID = "ca-app-pub-6562905997824789/6785143588"
  private var completionHandler: RewardedCompletion?
  private var ad: GADRewardedAd?
  
  var reward: (Int, String) = (0, "No reward")
  
  var isReady: Bool { return ad == nil ? false : ad!.isReady }
  
  override func loadAd() {
    ad = GADRewardedAd(adUnitID: RemoteConfigManager.rewardedAdUnitID)
    ad?.load(request()) { (error) in
      guard error == nil else { return }
      print("RYSU rewarded ad loaded with amount:\(self.ad!.reward!.amount) of type:\(self.ad!.reward!.type)")
    }
  }
  
  func showAd(fromRoot root: UIViewController, withCompletion completionHandler: @escaping RewardedCompletion) {
    if let ad = ad {
      ad.present(fromRootViewController: root, delegate: self)
    }
    GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: root)
    self.completionHandler = completionHandler
  }
  
}


extension RewardedAdManager: GADRewardedAdDelegate {
  
  func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
    print("rewarded \(reward.amount) of \(reward.type)")
    self.reward = (reward.amount.intValue, reward.type)
  }
  
  func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
    guard let handler = completionHandler else { loadAd(); return }
    
    handler(reward.0, reward.1)
    self.completionHandler = nil
    self.reward = (0, "No reward")
  }
  
}
