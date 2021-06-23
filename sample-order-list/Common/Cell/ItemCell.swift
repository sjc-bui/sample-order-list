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
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()

  private let quantityLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 20)
    return label
  }()
  
  private let totalLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 20)
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

  let button = UIButton()

  override func initialize() {
    commonInit()
  }

  var completion: (() -> Void)? = nil
  @objc func buttonTapped() {
    completion?()
  }

  func commonInit() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    button.translatesAutoresizingMaskIntoConstraints = false
    contentView.isUserInteractionEnabled = true

    addSubview(titleLabel)
    addSubview(button)

    button.setTitle("編集", for: UIControl.State.normal)
    button.titleLabel?.textColor = .white
    button.backgroundColor = .systemBlue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    button.layer.cornerRadius = 15
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    button.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    button.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    button.widthAnchor.constraint(equalToConstant: 80).isActive = true
    button.heightAnchor.constraint(equalToConstant: 30).isActive = true

    stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
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
