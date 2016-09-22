//
//  ADVScrollView.swift
//  Movie
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
protocol ChangeCurrentPage:NSObjectProtocol {
    func changePage(page:Int) -> Void
}


class ADVScrollView: UIScrollView , UIScrollViewDelegate{

    var imagesStr:[String]!
    weak var delegator:ChangeCurrentPage?
    var currentPage:Int?
    init(frame: CGRect,imageStr:[String]?,isTimer:Bool = false) {
        super.init(frame:frame)
        if imageStr == nil{
            return
        }
        self.imagesStr = imageStr
        // 多添加两张图片
        imagesStr.insert(imagesStr.last!, atIndex: 0)
        imagesStr.append(imagesStr[1])
        
        var rect = frame
        
        for i in 0..<imagesStr.count{
            rect.origin.x = frame.size.width * CGFloat(i)
            rect.origin.y = 0
            let iv = UIImageView.init(frame: rect)
            iv.sd_setImageWithURL(NSURL.init(string: imagesStr[i]))
            self.addSubview(iv)
        }
        self.contentSize = CGSizeMake(frame.width * CGFloat(imagesStr.count), 0)
        self.contentOffset = CGPointMake(frame.width, 0)
        self.pagingEnabled = true
        self.delegate = self
        if isTimer == false{
            return
        }
        currentPage = 0
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(self.timeRun), userInfo: nil, repeats: true)
        
    }
    
    func timeRun() -> Void {
        var page = Int(contentOffset.x / self.frame.width)
        page += 1
        if page == imagesStr.count - 1{
            self.contentOffset = CGPointZero
            page = 1
        }
        // 依次往后循环比较 
        self.setContentOffset(CGPointMake(CGFloat(page) * self.frame.width, 0), animated: true)
        // 调用代理方法
        self.currentPage = lrint(Double(self.contentOffset.x) / Double(self.frame.width))
        self.delegator?.changePage(currentPage! + 1)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0{
            scrollView.contentOffset = CGPointMake(CGFloat(imagesStr.count - 2) * scrollView.frame.width, 0)
        }else if scrollView.contentOffset.x == CGFloat(imagesStr.count - 1) * scrollView.frame.width{
            //
            scrollView.contentOffset = CGPointMake(scrollView.frame.width, 0)
        
        }
        self.currentPage = lrint(Double(scrollView.contentOffset.x) / Double(scrollView.frame.width))
        self.delegator?.changePage(currentPage!)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
















