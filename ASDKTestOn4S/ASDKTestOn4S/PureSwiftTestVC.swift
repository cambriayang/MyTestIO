//
//  PureSwiftTestVC.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 04/12/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

import Foundation

class PureSwiftTestVC: UIViewController {
    let name = "PureSwiftTestVC"
    
    //MARK: --- Initital
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
    
    //MARK: --- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //New way, Swift 3
        let queue = DispatchQueue(label: "shshsh.shshshshshshsh")
        
        //Right Email Regx
        let mailPattern = "^([a-zA-Z0-9]+[-|_\\-\\.])*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_\\-\\.])*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$"
        
        let matcher = MyRegex(mailPattern)
        let maybeMailAddress = "m@m-comx.cxn"
        
        if matcher.match(maybeMailAddress) {
            print("Correct Email!")
        }
        else{
            print("Wrong Email!")
        }
        
        queue.async {
            sleep(10)
        }
        
        
        let result =  [1, 2, 3, 4].accumulate(initial: 0, combine: +)
        
        print("result is:\(result)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: --- Regular
    struct MyRegex {
        let regex: NSRegularExpression?
        
        init(_ pattern: String) {
            regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        }
        
        func match(_ input: String) -> Bool {
            if let matches = regex?.matches(in: input,
                                            options: [],
                                            range: NSMakeRange(0, (input as NSString).length)) {
                return matches.count > 0
            }
            else {
                return false
            }
        }
    }
}

extension Array {
    func accumulate<U>(initial: U, combine: (U, Element) -> U) -> [U]  {
        var running = initial
        
        return self.map { next in
            running = combine(running, next)
            
            return running
        }
    }
}
