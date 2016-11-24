//
//  SwiftWithoutASDK.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/8/29.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import Foundation
import UIKit

class SwiftWithoutASDK : BaseViewController {
    //Class stuff here
    let name = "Cambria"
    let age = 18
    
    override func viewDidLoad() {
        //Because this class did not implements the cellForRow method. comment the 'super.viewDidLoad'
//        super.viewDidLoad()
        
        let closure = {
            print("==[Name is: \(self.name), age is: \(self.age)]==")
        }
        
        view.backgroundColor = UIColor.gray
        
        print(helloWorld())
        
        printMyClassName()
        
        closure()
    }
    
    //MARK: --- Printer
    func helloWorld() -> String {
        return "HelloWorld!"
    }
    
    override func printMyClassName() -> Void {
        super.printMyClassName()
        
        print("==[In \(self)]==");
    }
}

extension SwiftWithoutASDK: UITextFieldDelegate {
}
