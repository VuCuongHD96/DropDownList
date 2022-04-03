//
//  Orientation.swift
//  DropDownList
//
//  Created by Sun on 4/3/22.
//  Copyright © 2022 Sun. All rights reserved.
//

import UIKit

enum Orientation {
    case above(CGRect)
    case below(CGRect)
    
    init(textField: UITextField) {
        let textFieldX = textField.frame.origin.x
        let textFieldY = textField.frame.origin.y
        let textFieldHeight = textField.frame.height
        let textFieldWidth = textField.frame.width
        let ratio = textFieldY / Screen.height
        if ratio > 0.5 {
            let frame = CGRect(x: 0, y: 0, width: textFieldWidth, height: textFieldHeight)
            self = .above(frame)
        } else {
            let position = CGRect(x: textFieldX, y: textFieldY + textFieldHeight + 5, width: textFieldWidth, height: 10)
            self = .below(position)
        }
    }
    
    func getFrame() -> CGRect {
        switch self {
        case .below(let frame):
            return frame
        case .above(let frame):
            return frame
        }
    }
}
