//
//  MyInstance.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/13.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import Foundation

class MyInstance: NSObject {
    class var sharedInstance: MyInstance {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: MyInstance? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = MyInstance()
        }
        return Static.instance!
    }
}