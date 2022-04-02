//
//  MyTableView.swift
//  DropDownList
//
//  Created by Sun on 4/1/22.
//  Copyright © 2022 Sun. All rights reserved.
//

import UIKit

class MyTableView: UITableView {
    
    var dataArray = [String]()
    
    convenience init(textField: UITextField, dataArray: [String]) {
        let positon = MyTableView.getPositon(textField: textField)
        let frame = CGRect(x: positon.x, y: positon.y, width: textField.frame.width, height: 200)
        self.init(frame: frame, style: .plain)
        self.dataArray = dataArray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setNeedsLayout()
        dataSource = self
    }
    
    static func getPositon(textField: UITextField) -> CGPoint {
        let textFieldPosition = textField.frame.origin
        let point = CGPoint(x: textFieldPosition.x, y: textFieldPosition.y + textField.frame.height + 5)
        return point
    }
}

extension MyTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .green
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
}
