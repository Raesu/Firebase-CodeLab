//
//  DetailViewController.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseRemoteConfig

class DetailViewController: BaseViewController {
  
  var adWatched = false
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    
    let title = RemoteConfigManager.rewardedButtonTitle
    addButton(withTitle: title)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    Analytics.logEvent("details_viewed", parameters: ["param1": true])
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if isMovingFromParent {
      if adWatched == false { Analytics.logEvent("ad_declined", parameters: ["rewardAmount": 1]) }
    }
    
  }
  
  override func buttonPressed() {
    
    if adManager.rewardedAdManager.isReady {
      adManager.rewardedAdManager.showAd(fromRoot: self) { (rewardAmount, rewardType) in
        
        var title = ""
        var message = ""
        
        if rewardAmount > 0 {
          title = "Congratulations!"
          message = "You have gained \(rewardAmount) game currency for watching this ad."
          self.adWatched = true
        } else {
          title = "Sorry..."
          message = "You seem to have cancelled the ad before a reward was granted."
        }
        
        self.presentAlert(withTitle: title, message: message)
        
      }
    } else {
      
      let alert = UIAlertController(title: "Hmm...", message: "No ad is ready to watch. Attempt to reload?", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
        self.adManager.rewardedAdManager.loadAd()
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      self.navigationController?.present(alert, animated: true, completion: nil)
    
    }
  }
  
  func presentAlert(withTitle title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

}
