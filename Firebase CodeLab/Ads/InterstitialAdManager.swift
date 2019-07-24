//
//  InterstitialAdManager.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

//import GoogleMobileAds

class InterstitialAdManager: BaseAdManager {
  
//  private var completionHandler: (() -> Void)?
//  private var ad: GADInterstitial?
//
//  var isReady: Bool { return ad == nil ? false : ad!.isReady }
//
//  override func loadAd() {
//    ad = GADInterstitial(adUnitID: RemoteConfigManager.interstitialAdUnitID)
//    ad?.delegate = self
//    ad?.load(request())
//  }
//
//  func attemptToShowAd(fromViewController vc: UIViewController, withCompletion completionHandler: @escaping () -> Void) {
//    self.completionHandler = completionHandler
//
//    if let ad = ad, ad.isReady {
//      ad.present(fromRootViewController: vc)
//    } else {
//      loadAd()
//      completionHandler()
//      self.completionHandler = nil
//    }
//  }
//
//}
//
//extension InterstitialAdManager: GADInterstitialDelegate {
//
//  func interstitialDidReceiveAd(_ ad: GADInterstitial) {
//    print("RYSU interstitial ad loaded")
//  }
//
//  func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
//    print("RYSU interstitial ad failed to load: " + error.localizedDescription)
//  }
//
//  func interstitialDidDismissScreen(_ ad: GADInterstitial) {
//    print("RYSU interstitial dismissed")
//    loadAd()
//
//    if let handler = completionHandler { handler() }
//    completionHandler = nil
//
//  }
  
}
