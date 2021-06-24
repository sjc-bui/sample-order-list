//
//  UserInfoCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

class UserInfoCell: BaseViewCell {

  private let button: UIButton = {
    let btn = UIButton()
    btn.setTitle("Button", for: .normal)
    btn.backgroundColor = .systemPink
    btn.addRightIcon(image: UIImage(named: "chat") ?? UIImage())
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.layer.cornerRadius = 8
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

    button.snp.makeConstraints { make in
      make.top.left.equalTo(contentView).offset(10)
      make.bottom.equalTo(contentView).offset(-10)
      make.width.equalTo(100)
    }

    contentView.addSubview(label)

    label.snp.makeConstraints { make in
      make.left.equalTo(button.snp.right).offset(2)
      make.top.equalTo(contentView.snp.top).offset(10)
      make.right.equalTo(contentView.snp.right).offset(-10)
      make.bottom.equalTo(contentView.snp.bottom).offset(-10)
    }
  }

  @objc func didTapButton() {
    callBack?()
  }
}
