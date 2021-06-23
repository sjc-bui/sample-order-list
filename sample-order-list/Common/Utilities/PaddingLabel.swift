//
//  PaddingLabel.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

class PaddingLabel: UILabel {

  var topInset: CGFloat
  var leftInset: CGFloat
  var bottomInset: CGFloat
  var rightInset: CGFloat

  public init(withInsets top: CGFloat = 4.0,
              _ left: CGFloat = 8.0,
              _ bottom: CGFloat = 4.0,
              _ right: CGFloat = 8.0) {
    self.topInset = top
    self.leftInset = left
    self.bottomInset = bottom
    self.rightInset = right
    super.init(frame: CGRect.zero)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }

  override var intrinsicContentSize: CGSize {
    get {
        var contentSize = super.intrinsicContentSize
        contentSize.height += topInset + bottomInset
        contentSize.width += leftInset + rightInset
        return contentSize
    }
  }
}
