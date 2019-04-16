//
//  InterstitialAdManager.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import GoogleMobileAds

class InterstitialAdManager: BaseAdManager {
  
  var adUnitID = "ca-app-pub-6562905997824789/5875510304"
  private var completionHandler: (() -> Void)?
  
  private lazy var ad: GADInterstitial = {
    let ad = GADInterstitial(adUnitID: adUnitID)
    return ad
  }()
  
  override var isReady: Bool {
    return ad.isReady
  }
  
  override func loadAd() {
    ad = GADInterstitial(adUnitID: "ca-app-pub-6562905997824789/5875510304")
    ad.delegate = self
    ad.load(request())
  }
  
  func attemptToShowAd(fromViewController vc: UIViewController, withCompletion completionHandler: @escaping () -> Void) {
    self.completionHandler = completionHandler
    
    if ad.isReady {
      ad.present(fromRootViewController: vc)
    } else {
      ad.load(request())
      completionHandler()
      self.completionHandler = nil
    }
  }
  
}

extension InterstitialAdManager: GADInterstitialDelegate {
  
  func interstitialDidReceiveAd(_ ad: GADInterstitial) {
    print("ad loaded")
  }
  
  func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
    print("ad failed to load: " + error.localizedDescription)
  }
  
  func interstitialDidDismissScreen(_ ad: GADInterstitial) {
    print("interstitial dismissed")
    loadAd()
    
    if let handler = completionHandler { handler() }
    completionHandler = nil
    
  }
  
}
