//
//  DetailViewController.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    
    addButton(withTitle: "Watch an ad for a reward!")
    
  }
  
  override func buttonPressed() {
    
    if adManager.rewardedAdManager.isReady {
      adManager.rewardedAdManager.showAd(fromRoot: self) { (rewardAmount, rewardType) in
        
        var title = ""
        var message = ""
        
        if rewardAmount > 0 {
          title = "Congratulations!"
          message = "You have gained \(rewardAmount) game currency for watching this ad."
        } else {
          title = "Sorry..."
          message = "You seem to have cancelled the ad before a reward was granted."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
