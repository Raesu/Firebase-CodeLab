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
    request.testDevices = ["73f7aa69f9d9b86aad8d39280dfb80d8", kGADSimulatorID]
    return request
  }
  
}
