//
//  BaseViewController.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
  
  deinit {
    print("\(type(of: self)) deinited.")
  }
}
