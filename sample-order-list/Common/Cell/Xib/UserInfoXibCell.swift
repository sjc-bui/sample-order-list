//
//  UserInfoXibCell.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/24.
//

import UIKit

protocol UserInfoXibCellDelegate: AnyObject {
  func didClickedButton(tag: Int?, textField: String?)
  func segmentValueChanged(index: Int?)
}

class UserInfoXibCell: UITableViewCell {

  weak var delegate: UserInfoXibCellDelegate?
  private var text: String = "Textfield value.!!"

  @IBOutlet weak var xibCellLabel: UILabel!
  @IBOutlet weak var phone: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var segment: UISegmentedControl!
  
  @IBAction func EditClicked(_ sender: UIButton) {
    delegate?.didClickedButton(tag: sender.tag, textField: text)
  }

  @IBAction func Btn2(_ sender: UIButton) {
    delegate?.didClickedButton(tag: sender.tag, textField: text)
  }

  @IBAction func segmentCtr(_ sender: UISegmentedControl) {
    delegate?.segmentValueChanged(index: sender.selectedSegmentIndex)
    switch sender.selectedSegmentIndex {
      case 0:
        name.text = ""
      case 1:
        name.text = "まで"
      case 2:
        name.text = "以降"
      case 3:
        name.text = "ごろ"
      default:
        break
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    if #available(iOS 13.0, *) {
      segment.backgroundColor = UIColor.black
      segment.layer.borderColor = UIColor.white.cgColor
      segment.selectedSegmentTintColor = UIColor.white
      segment.layer.borderWidth = 1

       let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      segment.setTitleTextAttributes(titleTextAttributes, for:.normal)

       let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
      segment.setTitleTextAttributes(titleTextAttributes1, for:.selected)
     }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
}
