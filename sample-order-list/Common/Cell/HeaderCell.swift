//
//  HeaderCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class HeaderCell: BaseViewCell {

  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }

  private let titleLabel: PaddingLabel = {
    let label = PaddingLabel()
    label.textColor = .white
    label.layer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
    label.layer.cornerRadius = 18
    label.font = UIFont.systemFont(ofSize: 18)
    return label
  }()

  override func initialize() {
    commonInit()
  }

  var completion: (() -> Void)? = nil
  @objc func buttonTapped() {
    completion?()
  }

  func commonInit() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(titleLabel)

    titleLabel.sizeToFit()
    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
  }
}
