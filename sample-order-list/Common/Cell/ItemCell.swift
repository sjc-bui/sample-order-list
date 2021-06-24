//
//  ItemCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class ItemCell: BaseViewCell {

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

  var quantity: String? {
    didSet {
      quantityLabel.text = quantity
    }
  }

  var total: String? {
    didSet {
      totalLabel.text = total
    }
  }
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont.systemFont(ofSize: 18)
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 18)
    return label
  }()

  private let quantityLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18)
    return label
  }()
  
  private let totalLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 18)
    return label
  }()

  private lazy var priceStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .fillEqually
    stack.alignment = .fill
    stack.spacing = 2
    return stack
  }()

  private lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.alignment = .fill
    stack.spacing = 2
    return stack
  }()

  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("編集", for: UIControl.State.normal)
    button.titleLabel?.textColor = .white
    button.backgroundColor = .systemBlue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
    button.layer.cornerRadius = 15
    button.addRightIcon(image: UIImage(named: "see_more") ?? UIImage())
    return button
  }()

  override func initialize() {
    commonInit()
  }

  var completion: (() -> Void)? = nil
  @objc func buttonTapped() {
    completion?()
  }

  func commonInit() {
    contentView.isUserInteractionEnabled = true

    addSubview(titleLabel)
    addSubview(button)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    addSubview(stackView)

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(5)
      make.left.equalToSuperview().offset(20)
      make.right.equalTo(button.snp.left)
      make.bottom.equalTo(stackView.snp.top)
      make.height.equalTo(30)
    }

    button.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(5)
      make.left.equalTo(titleLabel.snp.right)
      make.right.equalToSuperview().offset(-10)
      make.width.equalTo(80)
      make.height.equalTo(30)
    }

    stackView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.left.equalToSuperview().offset(20)
      make.bottom.equalToSuperview()
      make.right.equalToSuperview().offset(-10)
    }
  }

  func setup(names: [String]) {
    stackView.arrangedSubviews.forEach { stackView.removeArrangedSubview($0); $0.removeFromSuperview() }
    names.forEach {
      let label = UILabel()
      label.textColor = .gray
      label.text = "　\($0)"
      label.font = UIFont.systemFont(ofSize: 20)
      stackView.addArrangedSubview(label)
    }

    if !names.isEmpty {
      priceStack.addArrangedSubview(priceLabel)
      priceStack.addArrangedSubview(quantityLabel)
      priceStack.addArrangedSubview(totalLabel)
      stackView.addArrangedSubview(priceStack)
    }
  }
}
