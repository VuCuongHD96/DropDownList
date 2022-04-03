//
//  ViewController.swift
//  DropDownList
//
//  Created by Sun on 4/1/22.
//  Copyright © 2022 Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: MyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.dataSource = self
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        myView.backgroundColor = .green
//        myView.frame.size.height = 300
        view.addSubview(myView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController: MyTextFieldDataSource {
    func dataArray() -> [String] {
        return ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5"]
    }
}
