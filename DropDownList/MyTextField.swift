//
//  MyTextField.swift
//  DropDownList
//
//  Created by Sun on 4/1/22.
//  Copyright © 2022 Sun. All rights reserved.
//

import UIKit

class MyTextField: UITextField {
    
    var dropDown: MyTableView!
    let dataArray = ["1", "2", "3", "4", "5"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    func setupDropDown() {
        let orientation = Orientation(textField: self)
        dropDown = MyTableView(dataArray: dataArray, orientation: orientation)
        if let superview = superview {
            superview.addSubview(dropDown)
        }
    }
    
    func setupView() {
        delegate = self
    }
}

extension MyTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupDropDown()
    }
}
