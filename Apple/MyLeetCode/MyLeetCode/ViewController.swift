//
//  ViewController.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/1.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codes: [LeetCode] = [ArrayCode(), StringCode(), LinkListCode(), TreeCode()];
        
        for code in codes {
            code.run()
        }
    }
}





