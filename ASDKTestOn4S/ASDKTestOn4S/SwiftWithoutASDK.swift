//
//  SwiftWithoutASDK.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/8/29.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import Foundation
import UIKit

class SwiftWithoutASDK : BaseViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        print("Hello, Swift!")
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillLayoutSubviews() {
        let textField: UITextField = UITextField.init(frame: CGRectMake(20, 100, 100, 50))
        
        self.view.addSubview(textField)
        
        textField.delegate = self
        textField.keyboardType = .DecimalPad
    }
    func helloWorld() -> String {
        print("I am in \(self)")
        return "HelloWorld!"
    }
}