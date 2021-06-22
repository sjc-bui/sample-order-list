//
//  SubTotalCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class SubTotalCell: UITableViewCell {
  
  let priceStack = UIStackView()
  let titleLabel = UILabel()
  let subLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  func commonInit() {
    priceStack.axis = .horizontal
    priceStack.distribution = .fillEqually
    priceStack.alignment = .leading
    priceStack.spacing = 2

    titleLabel.textColor = .gray
    titleLabel.font = UIFont.systemFont(ofSize: 20)

    subLabel.textColor = .gray
    subLabel.textAlignment = .right
    subLabel.font = UIFont.systemFont(ofSize: 20)

    priceStack.addArrangedSubview(titleLabel)
    priceStack.addArrangedSubview(subLabel)

    priceStack.translatesAutoresizingMaskIntoConstraints = false
    addSubview(priceStack)

    priceStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    priceStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    priceStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    priceStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
  }
}
