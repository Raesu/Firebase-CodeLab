//
//  BaseAdManager.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import GoogleMobileAds

class BaseAdManager: NSObject {
  
  func loadAd() {}
  
  func request() -> GADRequest {
    let request = GADRequest()
    request.testDevices = ["c484d6a91015fae88f41b78e6d1a6ccb", kGADSimulatorID]
    return request
  }
  
}
