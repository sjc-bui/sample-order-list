//
//  UserInfoCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

class UserInfoCell: BaseViewCell {

  let button: UIButton = {
    let btn = UIButton()
    btn.setTitle("Button", for: .normal)
    btn.backgroundColor = .systemPink
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    return btn
  }()

  let label: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.textColor = .systemPink
    return lbl
  }()

  var callBack: (() -> Void)? = nil

  override func initialize() {
    commonInit()
  }

  func commonInit() {
    contentView.addSubview(button)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    button.translatesAutoresizingMaskIntoConstraints = false
    button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

    contentView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 20).isActive = true
    label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
  }

  @objc func didTapButton() {
    callBack?()
  }
}
