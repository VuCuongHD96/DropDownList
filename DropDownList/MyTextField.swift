//
//  MyTextField.swift
//  DropDownList
//
//  Created by Sun on 4/1/22.
//  Copyright © 2022 Sun. All rights reserved.
//

import UIKit

protocol MyTextFieldDataSource {
    func dataArray() -> [String]
}

class MyTextField: UITextField {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 44
        static let tableViewMaxHeight = 5 * Constant.cellHeight
    }
    
    // MARK: - Property
    var dropDown: MyTableView!
    var dataSource: MyTextFieldDataSource?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    func setupDropDown() {
        let orientation = Orientation(textField: self)
        guard let dataArray = dataSource?.dataArray() else { return }
        dropDown = MyTableView(dataArray: dataArray, orientation: orientation)
        dropDown.myDelegate = self
        let tableViewHeight = CGFloat(dataArray.count) * Constant.cellHeight
        dropDown.frame.size.height = tableViewHeight < Constant.tableViewMaxHeight ? tableViewHeight : Constant.tableViewMaxHeight
        if let superview = superview {
            superview.addSubview(dropDown)
        }
    }
    
    func setupView() {
        delegate = self
        inputView = UIView()
    }
}

extension MyTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupDropDown()
    }
}

extension MyTextField: MyTableViewDelegate {
    func selected(data: String) {
        text = data
        resignFirstResponder()
    }
}
