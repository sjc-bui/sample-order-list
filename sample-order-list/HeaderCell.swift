//
//  HeaderCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class HeaderCell: UITableViewCell {

  let titleLabel = PaddingLabel(withInsets: 4, 8, 4, 8)

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
    titleLabel.textColor = .white
    titleLabel.layer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
    titleLabel.layer.cornerRadius = 18
    titleLabel.font = UIFont.systemFont(ofSize: 18)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(titleLabel)
    titleLabel.sizeToFit()

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
  }
}
