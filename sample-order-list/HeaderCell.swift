//
//  HeaderCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class HeaderCell: UITableViewCell {

  let titleLabel = PaddingLabel(withInsets: 8, 8, 8, 8)

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
    titleLabel.textColor = .gray
    titleLabel.layer.backgroundColor = UIColor.black.withAlphaComponent(0.14).cgColor
    titleLabel.layer.cornerRadius = 16
    titleLabel.font = UIFont.systemFont(ofSize: 20)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(titleLabel)

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
  }
}
