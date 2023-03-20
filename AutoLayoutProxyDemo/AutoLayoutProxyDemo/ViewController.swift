//
//  ViewController.swift
//  AutoLayoutProxyDemo
//
//  Created by Bibin Jacob Pulickal on 15/03/23.
//

import UIKit
import BBHelperKit
import AutoLayoutProxy

class ViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "AutoLayoutProxy"
    view.backgroundColor(.random)
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.register(TableViewCell.self)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 20 }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    tableView.dequeue(TableViewCell.self, for: indexPath)
      .backgroundColor(.random)
  }
}

class TableViewCell: UITableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    let leftView = UIView()
      .backgroundColor(.random)
      .addSuperview(contentView)
      .layout {
        $0.top.greaterThanOrEqualTo($1.top).constant(16)
        $0.leading.greaterThanOrEqualTo($1.leading).constant(16)
        $0.width.equalTo($1.width).multiplier(0.3).constant(-32)
        $0.bottom.lessThanOrEqualTo($1.bottom).constant(-16)
        $0.height.equalTo(128)
      }

    UIView()
      .backgroundColor(.random)
      .addSuperview(contentView)
      .layout {
        $0.top.equalTo(leftView.top)
        $0.leading.equalTo(leftView.trailing).constant(8)
        $0.bottom.equalTo(leftView.bottom)
        $0.trailing.equalTo($1.trailing).constant(-16)
      }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
