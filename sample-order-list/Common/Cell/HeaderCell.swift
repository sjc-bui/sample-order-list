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
    contentView.addSubview(titleLabel)

    titleLabel.sizeToFit()

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(3)
      make.bottom.equalToSuperview().offset(-3)
      make.left.equalToSuperview().offset(20)
    }
  }
}
