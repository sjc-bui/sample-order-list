//
//  ViewController.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class ViewController: BaseViewController {

  var sections: [String] = ["", "きしめんめん家", "かつ家", ""]
  var meat   = ["1　とんかつ定食", "2　唐揚げ定食", ""]
  var noodle = ["27　きしめん", ""]
  var meatOptions = [["みそ", "ご飯大盛り（+50）", "キャベツとカツを別々に"],
                     ["ご飯大盛り（+50）"],
                     []]
  var noodleOpt = [["白ごはん","麺大盛"],
                   []]
  var userInfo = "住所："
  
  fileprivate lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
//    tableView.separatorStyle = .none
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c")
    tableView.registerReuseCell(ItemCell.self)
    tableView.registerReuseCell(SubTotalCell.self)
    tableView.registerReuseCell(HeaderCell.self)
    tableView.registerReuseCell(UserInfoCell.self)
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    self.view.backgroundColor = UIColor.separator
    layoutTableView()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.meat.insert("3　チキン南蛮定食", at: 1)
      self.meatOptions.insert(["ご飯大盛"], at: 1)
      self.tableView.reloadData()

      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.noodle.insert("3　タンメン", at: 1)
        self.noodleOpt.insert(["ご飯大"], at: 1)
        self.tableView.reloadData()
      }
    }
  }

  func layoutTableView() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(self.view)
    }
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 {
      return meat.count
    } else if section == 2 {
      return noodle.count
    }
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 1 {
      if indexPath.row == meat.count - 1 {
        let cell: SubTotalCell = tableView.dequeueReusableCell(for: indexPath)
        cell.title = "小計"
        cell.price = "￥\(5 * 500 * (meat.count - 1))"
        cell.selectionStyle = .none
        return cell
      } else {
        let cell: ItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.title = meat[indexPath.row]
        cell.setup(names: meatOptions[indexPath.row])
        cell.price = "￥\(500)"
        cell.quantity = "\(5)点"
        cell.total = "￥\(5 * 500)"
        cell.completion = {
          print("`meat \(indexPath.section) \(indexPath.row)`")
        }
        cell.selectionStyle = .none
        return cell
      }
    } else if indexPath.section == 2 {
      if indexPath.row == noodle.count - 1 {
        let cell: SubTotalCell = tableView.dequeueReusableCell(for: indexPath)
        cell.title = "小計"
        cell.price = "￥\(10 * 1500 * (noodle.count - 1))"
        cell.selectionStyle = .none
        return cell
      } else {
        let cell: ItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.title = noodle[indexPath.row]
        cell.setup(names: noodleOpt[indexPath.row])
        cell.price = "￥\(1500)"
        cell.quantity = "\(10)点"
        cell.total = "￥\(10 * 1500)"
        cell.completion = {
          print("`noodle` \(indexPath.section) \(indexPath.row)")
        }
        cell.selectionStyle = .none
        return cell
      }
    } else {
      let cell: UserInfoCell = tableView.dequeueReusableCell(for: indexPath)
      cell.label.text = userInfo
      cell.callBack = {
        cell.label.text = "button is clicked."
      }
      cell.selectionStyle = .none
      return cell
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
//    let menuView = MenuViewController()
//    self.present(menuView, animated: true, completion: nil)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell: HeaderCell = tableView.dequeueReusableCell()
    cell.backgroundColor = .systemGroupedBackground
    cell.title = sections[section]
    return cell
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 || section == (sections.count - 1) ? 0 : 40
  }
}
