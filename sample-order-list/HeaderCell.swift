//
//  HeaderCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class HeaderCell: UITableViewCell {

  let priceStack = UIStackView()
  let titleLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  var completion: (() -> Void)? = nil
  @objc func buttonTapped() {
    completion?()
  }

  func commonInit() {
    priceStack.axis = .horizontal
    priceStack.distribution = .fill
    priceStack.alignment = .leading
    priceStack.spacing = 2

    titleLabel.textColor = .gray
    titleLabel.font = UIFont.systemFont(ofSize: 20)

    priceStack.addArrangedSubview(titleLabel)

    priceStack.translatesAutoresizingMaskIntoConstraints = false
    addSubview(priceStack)

    priceStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    priceStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    priceStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    priceStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
  }
}
