//
//  MyInstance.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/13.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import Foundation

class MyInstance: NSObject {
    //let is thread-safe
    static let sharedInstance = MyInstance()
    
    override fileprivate init() {}
}
