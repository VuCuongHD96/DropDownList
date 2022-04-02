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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        delegate = self
    }
    
    func setupDropDown() {
        dropDown = MyTableView(textField: self, dataArray: dataArray)
        if let superview = superview {
            superview.addSubview(dropDown)
        }
    }
}

extension MyTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupDropDown()
    }
}
