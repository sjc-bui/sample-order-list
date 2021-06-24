//
//  UserInfoXibCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/24.
//

import UIKit

protocol UserInfoXibCellDelegate: AnyObject {
  func didClickedButton(tag: Int?, textField: String?)
}

class UserInfoXibCell: UITableViewCell {

  weak var delegate: UserInfoXibCellDelegate?
  private var text: String = "Textfield value.!!"

  @IBOutlet weak var xibCellLabel: UILabel!
  @IBOutlet weak var phone: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var DescriptionLabel: UILabel!

  @IBAction func EditClicked(_ sender: UIButton) {
    delegate?.didClickedButton(tag: sender.tag, textField: text)
  }

  @IBAction func Btn2(_ sender: UIButton) {
    delegate?.didClickedButton(tag: sender.tag, textField: text)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
}
