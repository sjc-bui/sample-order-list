//
//  ItemCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class ItemCell: UITableViewCell {

  let titleLabel = UILabel()
  let stackView = UIStackView()
  let itemPrice = UILabel()
  let quantity = UILabel()
  let total = UILabel()
  
  let button = UIButton()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      commonInit()
  }

  var completion: (() -> Void)? = nil
  @objc func buttonTapped() {
    completion?()
  }

  func commonInit() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    button.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.systemFont(ofSize: 20)
    contentView.isUserInteractionEnabled = true

    addSubview(titleLabel)
    addSubview(button)

    button.setTitle("編集", for: UIControl.State.normal)
    button.titleLabel?.textColor = .white
    button.backgroundColor = .systemBlue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    button.layer.cornerRadius = 2.0
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
    stackView.spacing = 2
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    button.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    button.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
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
      let priceStack = UIStackView()
      priceStack.axis = .horizontal
      priceStack.distribution = .fillEqually
      priceStack.alignment = .fill
      priceStack.spacing = 2
  
      itemPrice.textColor = .gray
      itemPrice.font = UIFont.systemFont(ofSize: 20)

      quantity.textColor = .gray
      quantity.textAlignment = .center
      quantity.font = UIFont.systemFont(ofSize: 20)

      total.textColor = .gray
      total.textAlignment = .right
      total.font = UIFont.systemFont(ofSize: 20)

      priceStack.addArrangedSubview(itemPrice)
      priceStack.addArrangedSubview(quantity)
      priceStack.addArrangedSubview(total)
      
      stackView.addArrangedSubview(priceStack)
    }
  }
}
