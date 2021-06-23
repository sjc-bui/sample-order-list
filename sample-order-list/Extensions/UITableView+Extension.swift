//
//  UITableView+Extension.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

public protocol Reusable {
  static var reuseIdentifier: String { get }
}

public extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: Self.self)
  }
}

public extension UITableView {
  func registerReuseCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }

  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      return T()
    }
    return cell
  }

  func dequeueReusableCell<T: UITableViewCell>() -> T where T: Reusable {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
      return T()
    }
    return cell
  }
}
