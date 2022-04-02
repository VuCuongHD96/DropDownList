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
        let frame = MyTableView.makeTableViewFrame(textField: textField)
        self.init(frame: frame, style: .plain)
        self.dataArray = dataArray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setNeedsLayout()
        dataSource = self
    }
    
    static func makeTableViewFrame(textField: UITextField) -> CGRect {
        let textFieldPosition = textField.frame.origin
        let point = CGPoint(x: textFieldPosition.x, y: textFieldPosition.y + textField.frame.height + 5)
        let frame = CGRect(x: point.x, y: point.y, width: textField.frame.width, height: 200)
        return frame
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
