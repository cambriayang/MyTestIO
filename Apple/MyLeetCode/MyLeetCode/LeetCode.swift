//
//  LeetCode.swift
//  MyLeetCode
//
//  Created by Argost on 2022/4/30.
//  Copyright © 2022 Argost. All rights reserved.
//

import Foundation

class LeetCode : NSObject {
    func printSeperator() -> Void {
        let myFullName = NSStringFromClass(type(of: self))
        let myName = myFullName.components(separatedBy: ".").last!
        print("========================LeetCode: \(myName)=========================")
    }
    
    public func run() {
        let _: Void = self.printSeperator()
    }
}
