//
//  TicketController.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class TicketController: UIViewController {
    
    let titleSeg:UISegmentedControl = UISegmentedControl.init(items: ["电影","影院"])
    let contentSeg:UISegmentedControl = UISegmentedControl.init(items: ["正在热映","即将上映"])
    var contentScrollView:UIScrollView? = nil
    let tableView1 = UITableView()
    var dataArr1 = [IsHitModel]()
    let tableView2 = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.makeUI()
        
    }
    func makeUI() -> Void {
        let titleView = UIView.init(frame: CGRectMake(0, 0, 200, 40))
        titleSeg.frame = CGRectMake(0, 0, 200, 40)
        titleSeg.selectedSegmentIndex = 0
        titleSeg.backgroundColor = UIColor.clearColor()
        titleSeg.tintColor = UIColor.whiteColor()
        titleSeg.layer.masksToBounds = true
        titleSeg.layer.cornerRadius = 20
        titleSeg.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(20)], forState: .Normal)
        titleSeg.addTarget(self, action: #selector(self.titleSegChange(_:)), forControlEvents: .ValueChanged)
        titleView.addSubview(titleSeg)
        self.navigationItem.titleView = titleView
        
        contentSeg.frame = CGRectMake(0, 0, Tool.SC_width, 40)
        contentSeg.selectedSegmentIndex = 0
        contentSeg.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        contentSeg.tintColor = UIColor.init(red: 10 / 255.0, green: 48 / 255.0, blue: 141 / 255.0, alpha: 1.0)
        contentSeg.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(20)], forState: .Normal)
        contentSeg.addTarget(self, action: #selector(self.contentSegChange(_:)), forControlEvents: .ValueChanged)
        self.view.addSubview(contentSeg)
        
        
        contentScrollView = UIScrollView.init(frame: CGRectMake(0, 40, Tool.SC_width, Tool.SC_height - 64 - 40 - 49))
        //        contentScrollView!.backgroundColor = UIColor.redColor()
        let view1 = UIView.init(frame: CGRectMake(0, 0, Tool.SC_width, Tool.SC_height - 64 - 40 - 49))
        tableView1.frame = view1.frame
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.estimatedRowHeight = 140
        tableView1.registerNib(UINib.init(nibName: "IsHitCell", bundle: nil), forCellReuseIdentifier: "cell1")
        view1.addSubview(tableView1)
        view1.backgroundColor = UIColor.greenColor()
        view1.userInteractionEnabled = true
        contentScrollView!.addSubview(view1)
        
        
        let view2 = UIView.init(frame: CGRectMake(Tool.SC_width, 0, Tool.SC_width, Tool.SC_height - 64 - 40 - 49))
        view2.backgroundColor = UIColor.redColor()
        view2.userInteractionEnabled = true
        contentScrollView!.addSubview(view2)
        
        
        contentScrollView!.showsHorizontalScrollIndicator = true
        contentScrollView!.contentSize = CGSizeMake(Tool.SC_width * 2, 0)
        contentScrollView?.pagingEnabled = true
        contentScrollView?.delegate = self
        self.view.addSubview(contentScrollView!)
        
        print(contentScrollView!.frame)
        
        
        
    }
    // 页面即将显示
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let path1 = "http://api.m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290"
        let mc1 = MyConnection.init(urlStr: path1, target: self, action: #selector(self.connectionFinish1(_:)))
        mc1.start()
    }
    
    
    //网络请求完成
    func connectionFinish1(mc:MyConnection) -> Void {
        if mc.isFinish{
            let dic = try! NSJSONSerialization.JSONObjectWithData(mc.downLoadData, options: .AllowFragments) as! NSDictionary
            let arr = dic["movies"] as! NSArray
            for ele in arr{
                dataArr1.append(IsHitModel.createModel(ele as! NSDictionary))
            }
            
        }else{
            print("请求失败")
        }
        tableView1.reloadData()
    }
    
    
    //
    func contentSegChange(sender:UISegmentedControl) -> Void {
        contentScrollView?.setContentOffset(CGPointMake( CGFloat(sender.selectedSegmentIndex) * Tool.SC_width, 0), animated: false)
    }
    
    
    func titleSegChange(sender:UISegmentedControl) -> Void {
        
        
        
    }
    
    
    
}

extension TicketController:UIScrollViewDelegate{
    // 已经滑动完毕
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        contentSeg.selectedSegmentIndex = Int(scrollView.contentOffset.x / Tool.SC_width)
    }
}

extension TicketController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contentSeg.selectedSegmentIndex == 0{
            return dataArr1.count
        }
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if contentSeg.selectedSegmentIndex == 0{
            let cell1 = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! IsHitCell
            cell1.customCell(dataArr1[indexPath.row])
            return cell1
        }
        let cell2 = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath)
        return cell2
    }
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if contentSeg.selectedSegmentIndex == 0{
//            return 140
//        }
//        return 120
//    }
}















