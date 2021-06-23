//
//  ViewController.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/22.
//

import UIKit

class ViewController: UIViewController {

  var tableView: UITableView!
  var sections: [String] = ["", "きしめんめん家", "かつ家", ""]
  var meat   = ["1　とんかつ定食", "2　唐揚げ定食", ""]
  var noodle = ["27　きしめん", ""]
  var meatOptions = [["みそ", "ご飯大盛り（+50）", "キャベツとカツを別々に"],
                     ["ご飯大盛り（+50）"],
                     []]
  var noodleOpt = [["白ごはん","麺大盛"],
                   []]
  var userInfo = "住所："

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    tableView = UITableView(frame: .zero, style: .grouped)
    tableView.delegate = self
    tableView.dataSource = self

    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c")
    tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
    tableView.register(SubTotalCell.self, forCellReuseIdentifier: "sub")
    tableView.register(HeaderCell.self, forCellReuseIdentifier: "header")
    tableView.register(UserInfoCell.self, forCellReuseIdentifier: "user")

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

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

  let scrollView: UIScrollView = {
      let scrollView = UIScrollView()

      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
  }()

  let scrollViewContainer: UIStackView = {
      let view = UIStackView()

      view.axis = .vertical
      view.spacing = 10

      view.translatesAutoresizingMaskIntoConstraints = false
      return view
  }()

  let redView: UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 500).isActive = true
      view.backgroundColor = .red
      return view
  }()

  let blueView: UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 200).isActive = true
      view.backgroundColor = .blue
      return view
  }()

  let greenView: UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 300).isActive = true
      view.backgroundColor = .green
      return view
  }()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "sub", for: indexPath) as! SubTotalCell
        cell.titleLabel.text = "小計"
        cell.subLabel.text = "￥\(5 * 500 * (meat.count - 1))"
        cell.selectionStyle = .none
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.titleLabel.text = meat[indexPath.row]
        cell.setup(names: meatOptions[indexPath.row])
        cell.itemPrice.text = "￥\(500)"
        cell.quantity.text = "\(5)点"
        cell.total.text = "￥\(5 * 500)"
        cell.completion = {
          print("`meat \(indexPath.section) \(indexPath.row)`")
        }
        cell.selectionStyle = .none
        return cell
      }
    } else if indexPath.section == 2 {
      if indexPath.row == noodle.count - 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sub", for: indexPath) as! SubTotalCell
        cell.titleLabel.text = "小計"
        cell.subLabel.text = "￥\(10 * 1500 * (noodle.count - 1))"
        cell.selectionStyle = .none
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.titleLabel.text = noodle[indexPath.row]
        cell.setup(names: noodleOpt[indexPath.row])
        cell.itemPrice.text = "￥\(1500)"
        cell.quantity.text = "\(10)点"
        cell.total.text = "￥\(10 * 1500)"
        cell.completion = {
          print("`noodle` \(indexPath.section) \(indexPath.row)")
        }
        cell.selectionStyle = .none
        return cell
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "user", for: indexPath) as! UserInfoCell
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
    cell.backgroundColor = .systemGroupedBackground
    cell.titleLabel.text = sections[section]
    return cell
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 || section == (sections.count - 1) ? 0 : 40
  }
}
