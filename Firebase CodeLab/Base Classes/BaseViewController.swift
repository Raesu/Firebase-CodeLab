//
//  BaseViewController.swift
//  Firebase CodeLab
//
//  Created by Ryan Summe on 4/16/19.
//  Copyright © 2019 Ryan Summe. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

class BaseViewController: UIViewController {
  
  let adManager: AdManager
  
  init(adManager: AdManager) {
    self.adManager = adManager
    super.init(nibName: nil, bundle: nil)
  }
  
  func addButton(withTitle title: String) {
    let button = UIButton(type: .roundedRect)
    button.titleLabel?.font = .systemFont(ofSize: 32)
    button.setTitle(title, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.textAlignment = .center
    
    view.addSubview(button)
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-24-[button]-24-|", options: [], metrics: nil, views: ["button":button]))
    
  }

  @objc func buttonPressed() {}
  
  required init?(coder aDecoder: NSCoder) {
    return nil
  }
}
