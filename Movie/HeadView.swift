//
//  HeadView.swift
//  Movie
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HeadView: UIView {

    
    var pageCont = UIPageControl()
    
     // 数据源
    var dataArr = [MovieModel]()
    var dataArr2 = [AdVModel]()
    var imagesStr = [String]()
    
    var advRect:CGRect!
    var contentRect:CGRect!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let path = "http://api.m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290"
        let mc = MyConnection.init(urlStr: path, target: self, action: #selector(self.connectionFinish(_:)))
        mc.start()
        
        
        let path2 = "http://api.m.mtime.cn/PageSubArea/GetFirstPageAdvAndNews.api?subFifthParam=18159583%231%230&subFistParam=17728960%231%230&subSecondParam=17304115%231%230&subThirdParam=17304116%231%230"
        let mc2 = MyConnection.init(urlStr: path2, target: self, action: #selector(self.connectionFinish2(_:)))
        mc2.start()
        
        
        let advRect:CGRect = CGRectMake(0, 0, frame.width, frame.height * Tool.advScrollView_height)
        let contentRect:CGRect = CGRectMake(0,10 + frame.height * Tool.advScrollView_height, frame.width, frame.height * Tool.contentScrollView_height)
        
        self.advRect = advRect
        self.contentRect = contentRect

    }
    
    func maekUI() -> Void {
        let contentScroll = ContentScrollView.init(frame: contentRect, dataArr: dataArr)
//        contentScroll.backgroundColor = UIColor.redColor()
        self.addSubview(contentScroll)
    }
    
    func makeAdv() -> Void {
        let advScroll = ADVScrollView.init(frame:advRect, imageStr: imagesStr,isTimer: true)
        advScroll.showsHorizontalScrollIndicator = false
        advScroll.delegator = self
        self.addSubview(advScroll)
        let pageRect = CGRectMake(300, 190, 100, 20)
        pageCont.frame = pageRect
        pageCont.numberOfPages = imagesStr.count
   
        pageCont.currentPage = advScroll.currentPage!
        pageCont.userInteractionEnabled = false
        // 小圆点的颜色
        pageCont.currentPageIndicatorTintColor = UIColor.redColor()
        pageCont.pageIndicatorTintColor = UIColor.greenColor()
        
        // 添加到视图
        self.addSubview(pageCont)
    }
    
    func connectionFinish(mc:MyConnection) -> Void {
        if mc.isFinish{
            // 数据解析
            let dic = try! NSJSONSerialization.JSONObjectWithData(mc.downLoadData, options: .AllowFragments)
            let moviesArr = dic["movies"] as! NSArray
            for movie in moviesArr{
                dataArr.append(MovieModel.modelWith(movie as! NSDictionary))
            }
            self.maekUI()
            
        }else{
            print("网络请求失败")
        }
    }
    
    func connectionFinish2(mc:MyConnection) -> Void {
        if mc.isFinish {
            // 数据解析
            let dic = try! NSJSONSerialization.JSONObjectWithData(mc.downLoadData, options: .AllowFragments)
            let arr = dic["advList"] as! NSArray
            for adv in arr{
                dataArr2.append(AdVModel.createModel(adv as! NSDictionary))
                imagesStr.append((adv as! NSDictionary)["img2"] as! String)
            }
            self.makeAdv()
        }else{
            print("网络请求失败")
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension HeadView:ChangeCurrentPage{
    func changePage(page: Int) {
        self.pageCont.currentPage = page - 1
    }
}



















