//
//  ViewController.swift
//  Movie
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 今日热点
    var dataArr = [HotModel]()
    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        self.createUI()
        
    }
    func createUI() -> Void {

        // 创建头视图
        
        self.view.backgroundColor = UIColor.brownColor()
        let frame = CGRectMake(0, 0, Tool.SC_width,Tool.SC_height * Tool.headView_height)
        
        let head = HeadView.init(frame: frame)
        
        tableView = UITableView.init(frame: CGRectMake(0, 0, Tool.SC_width, Tool.SC_height - 64 - 50))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = head
        self.view.addSubview(tableView)
        tableView.registerNib(UINib.init(nibName: "HotCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let urlStr = "http://api.m.mtime.cn/PageSubArea/GetFirstPageAdvAndNews.api?subFifthParam=18159583%231%230&subFistParam=17728960%231%230&subSecondParam=17304115%231%230&subThirdParam=17304116%231%230"
        let mc = MyConnection.init(urlStr: urlStr, target: self, action: #selector(self.connectionFinish(_:)))
        mc.start()
    }
    
    
    func connectionFinish(mc:MyConnection) -> Void {
        if mc.isFinish{
            // 解析数据
            let dic = try! NSJSONSerialization.JSONObjectWithData(mc.downLoadData, options: .AllowFragments) as! NSDictionary
            let arr = dic["hotPoints"] as! NSArray
            for ele in arr{
                dataArr.append(HotModel.createModel(ele as! NSDictionary as! [String : AnyObject]))
            }
            
            
        }else{
            print("网络请求失败")
        }
        tableView.reloadData()
        
    }
    
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HotCell
        cell.customCell(dataArr[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        self.navigationController?.navigationBar.hidden = true
//    }
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        self.navigationController?.navigationBar.hidden = false
//    }
    
}





























