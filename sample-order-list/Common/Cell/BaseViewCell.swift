//
//  BaseViewCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

open class BaseViewCell: UITableViewCell, Reusable {

  override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    initialize()
  }

  required public init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  func initialize() {}
}
