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
    
    convenience init(dataArray: [String], orientation: Orientation) {
        let frame = orientation.getFrame()
        self.init(frame: frame, style: .plain)
        self.dataArray = dataArray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setNeedsLayout()
        dataSource = self
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
