//
//  LFMessageTestVC.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 27/11/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

import Foundation

class LFMessageTestVC: UIViewController {
    let name = "LFMessageTestVC"

    //MARK: --- Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        view.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle:  nil)
    }
    
    //MARK: --- Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let m1 = LFMessage(name: "xxx");
        let m2 = LFMessage(name: "yyy", messageType:LFMessageType.vcAction, messagePriority:LFMessagePriority.default)
        let m3 = LFMessage(name: "zzz", subMessages: [m1, m2])
        
        print("m1: \(m1.subMessages)")
        
        print("m2: \(m2.subMessages)")
        
        print("m3: \(m3.subMessages)")
//        LFMessage *m1 = [LFMessage message]
    }
}
