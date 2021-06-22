//
//  ViewController.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class ViewController: UIViewController {

  var tableView: UITableView!
  var sections: [String] = ["きしめん家", "とんかつ家"]
  var meat   = ["1　とんかつ定食", "2　唐揚げ定食", ""]
  var noodle = ["27　きしめん", ""]
  var meatOptions = [["みそ", "ご飯大盛り（+50）", "キャベツとカツを別々に"],
                     ["ご飯大盛り（+50）"],
                     []]
  var noodleOpt = [["白ごはん","麺大盛"],
                   []]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView = UITableView(frame: .zero, style: .grouped)
    tableView.delegate = self
    tableView.dataSource = self

    let innerView = UIView()
    innerView.backgroundColor = .systemBlue
    view.addSubview(innerView)

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c")
    tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
    tableView.register(SubTotalCell.self, forCellReuseIdentifier: "sub")
    tableView.register(HeaderCell.self, forCellReuseIdentifier: "header")
    view.addSubview(tableView)

    // Layout
    innerView.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      innerView.topAnchor.constraint(equalTo: view.topAnchor),
      innerView.leftAnchor.constraint(equalTo: view.leftAnchor),
      innerView.rightAnchor.constraint(equalTo: view.rightAnchor),
      innerView.heightAnchor.constraint(equalToConstant: 150),

      tableView.topAnchor.constraint(equalTo: innerView.bottomAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
    ])
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.meat.remove(at: 0)
      self.meatOptions.remove(at: 0)
      self.tableView.reloadData()
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
      self.noodle.insert("3　タンメン", at: 1)
      self.noodleOpt.insert(["ご飯大"], at: 1)
      self.tableView.reloadData()
    }
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return meat.count
    }
    return noodle.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "c")
    if indexPath.section == 0 {
      if indexPath.row == meat.count - 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sub", for: indexPath) as! SubTotalCell
        cell.titleLabel.text = "小計"
        cell.subLabel.text = "￥\(5 * 500 * (meat.count - 1))"
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.titleLabel.text = meat[indexPath.row]
        cell.setup(names: meatOptions[indexPath.row])
        cell.itemPrice.text = "￥\(500)"
        cell.quantity.text = "\(5)点"
        cell.total.text = "￥\(5 * 500)"
        return cell
      }
    } else if indexPath.section == 1 {
      if indexPath.row == noodle.count - 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sub", for: indexPath) as! SubTotalCell
        cell.titleLabel.text = "小計"
        cell.subLabel.text = "￥\(10 * 1500 * (noodle.count - 1))"
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.titleLabel.text = noodle[indexPath.row]
        cell.setup(names: noodleOpt[indexPath.row])
        cell.itemPrice.text = "￥\(1500)"
        cell.quantity.text = "\(10)点"
        cell.total.text = "￥\(10 * 1500)"
        return cell
      }
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let menuView = MenuViewController()
    self.present(menuView, animated: true, completion: nil)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
    cell.backgroundColor = .systemGroupedBackground
    cell.titleLabel.text = sections[section]
    cell.subLabel.text = "編集"
    return cell
  }
}