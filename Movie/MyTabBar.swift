//
//  MyTabBar.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    func makeUI() -> Void {
        //工程名
        let proName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // 拿到plist 文件路径
        let path = NSBundle.mainBundle().pathForResource("MyTabBarList", ofType: "plist")
        // 将plist 数据读到数组里
        let plistArr = NSArray.init(contentsOfFile: path!) as! [[String:String]]
        for dic in plistArr{
            let name = proName + "." + dic["name"]!
            let cls = NSClassFromString(name) as! UIViewController.Type
            let vc = cls.init()
            
            vc.navigationItem.title = dic["title"]
            
            let nav = UINavigationController.init(rootViewController:vc)
            vc.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "header_bg.png"), forBarMetrics: .Default)
//            vc.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIColor.whiteColor()]
            
            let image = UIImage.init(named: dic["image"]!)?.imageWithRenderingMode(.AlwaysOriginal)
            let selectedImage = UIImage.init(named: dic["selectedImage"]!)?.imageWithRenderingMode(.AlwaysOriginal)
            nav.tabBarItem = UITabBarItem.init(title: dic["title"], image: image, selectedImage: selectedImage)
            self.tabBar.tintColor = UIColor.init(red: 194, green: 176, blue: 0, alpha: 1.0)
            self.tabBar.backgroundImage = UIImage.init(named: "tabbg")
            self.addChildViewController(nav)
            
        }
    }
    
    
}












