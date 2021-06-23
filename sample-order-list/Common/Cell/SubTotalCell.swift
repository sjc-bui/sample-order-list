//
//  SubTotalCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class SubTotalCell: BaseViewCell {

  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }

  var price: String? {
    didSet {
      priceLabel.text = price
    }
  }

  private lazy var priceStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .fillEqually
    stack.alignment = .leading
    stack.spacing = 2
    return stack
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()

  override func initialize() {
    commonInit()
  }

  func commonInit() {
    priceStack.translatesAutoresizingMaskIntoConstraints = false
    addSubview(priceStack)
    priceStack.addArrangedSubview(titleLabel)
    priceStack.addArrangedSubview(priceLabel)

    priceStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    priceStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    priceStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    priceStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
  }
}
