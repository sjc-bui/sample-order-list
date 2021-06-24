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
    addSubview(priceStack)
    priceStack.addArrangedSubview(titleLabel)
    priceStack.addArrangedSubview(priceLabel)

    priceStack.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.bottom.equalToSuperview().offset(-10)
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-10)
    }
  }
}
