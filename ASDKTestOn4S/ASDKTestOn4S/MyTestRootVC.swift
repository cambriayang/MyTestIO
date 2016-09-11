//
//  MyTestRootVC.swift
//  ASDKTestOn4S
//
//  Created by CambriaYang on 16/9/11.
//  Copyright © 2016年 CambriaYang. All rights reserved.
//

import UIKit

class MyTestRootVC: BaseViewController {
    let testDataSource = [String(DecimalNumberPadForH5TestVC)];
    
    //MARK --- Life Cycle
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.baseTableView .registerNib(UINib.init(nibName: "MyTestRootVCCell", bundle: nil), forCellReuseIdentifier: "MyTestRootVCCell")
        
        self.title = "MyTestRootVC"
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTestRootVCCell", forIndexPath: indexPath) as! MyTestRootVCCell

        cell.textLabel?.text = testDataSource[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let testCase = testDataSource[indexPath.row]
        
        if let vc = swiftClassFromString(testCase) {
            vc.title = testCase
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDataSource.count
    }
}

extension MyTestRootVC {
    func swiftClassFromString(className: String) -> UIViewController? {
        //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
        //官方文档方法：let myPersonClass: AnyClass? = NSClassFromString("MyGreatApp.Person")
        if  let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String {
            let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
            let  cls: AnyClass? = NSClassFromString(classStringName)
            assert(cls != nil, "==[class not found,please check className]==")
            if let viewClass = cls as? UIViewController.Type {
                let view = viewClass.init()
                return view
            }
        }
        
        return nil;
    }
}