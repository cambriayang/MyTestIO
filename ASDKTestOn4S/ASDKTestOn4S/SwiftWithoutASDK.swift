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
    override func viewDidLoad() {
//        super.viewDidLoad()
        
        print("Hello, Swift!")
    }
    
    func helloWorld() -> String {
        print("I am in \(self)")
        return "HelloWorld!"
    }
}