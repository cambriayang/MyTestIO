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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        view.backgroundColor = UIColor.purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle:  nil)
    }
}
