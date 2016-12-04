//
//  DecimalNumberPadForH5TestVC.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/11.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import Foundation

class DecimalNumberPadForH5TestVC: UIViewController {
    let name = "DecimalNumberPadForH5TestVC"
    
    //MARK: --- Initital
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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
