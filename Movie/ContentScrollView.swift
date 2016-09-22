//
//  ContentScrollView.swift
//  Movie
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ContentScrollView: UIScrollView {
    let mv_Widht:CGFloat = 150
    var dataArr:[MovieModel]!
    init(frame: CGRect,dataArr:[MovieModel]) {
        super.init(frame: frame)
        self.dataArr = dataArr
        self.showsHorizontalScrollIndicator = false
        for i in 0..<dataArr.count{
            let model = dataArr[i]
            let rect = CGRectMake(10 + (mv_Widht + 10) * CGFloat(i), 0, mv_Widht, frame.height)
            let vw = MovieView.init(frame: rect, url: model.img!, title: model.titleCn! , target: self, action:#selector(self.buttonClick),rat: model.ratingFinal!)
            self.addSubview(vw)
        }
        self.contentSize = CGSizeMake(CGFloat(dataArr.count) * (mv_Widht + 10) + 10, 0)
        
    }
    
    func buttonClick() -> Void {
        print("点击购票了")
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    

}
