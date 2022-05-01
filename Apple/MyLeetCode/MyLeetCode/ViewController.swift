//
//  ViewController.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/1.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

func classFromString(_ className: String) -> AnyClass? {
    /// get namespace
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

    /// get 'anyClass' with classname and namespace
    let cls: AnyClass? =  NSClassFromString("\(namespace).\(className)")

    // return AnyClass!
    return cls
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codesListPath = Bundle.main.path(forResource: "CodesList", ofType: "plist")
        
        guard let codesList = NSArray(contentsOfFile: codesListPath!) else {
            //报错
            exit(-1)
        }
        
        for code in codesList {
            let _ = (classFromString("\(code)") as! LeetCode.Type).init()
        }
    }
}





