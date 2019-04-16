//
//  ViewController.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ViewController: BaseViewController {

  override func loadView() {
    super.loadView()
    
    view.backgroundColor = .white
    navigationItem.title = "Firebase CodeLab!"
    
    addButton(withTitle: "Check Details Page")
    
  }

  @objc override func buttonPressed() {
    
    adManager.interstitialAdManager.attemptToShowAd(fromViewController: self) {
      let vc = DetailViewController(adManager: self.adManager)
      self.navigationController?.pushViewController(vc, animated: true)
    }
    
  }

}

