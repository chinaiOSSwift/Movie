//
//  BaseViewController.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let red:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
    let blue:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
    let green:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
