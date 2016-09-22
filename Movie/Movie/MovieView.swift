//
//  MovieView.swift
//  Movie
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MovieView: UIView {
    let imageView = UIImageView()
    let titleLabe = UILabel()
    var buyButton:UIButton?
    var ratingFinalLabel = UILabel()
    
    var target:AnyObject?
    var action:Selector?
    
    init(frame: CGRect,url:String,title:String,target:AnyObject,action:Selector,rat:Float) {
        super.init(frame: frame)
        
        self.userInteractionEnabled = true
        self.target = target
        self.action = action
        ratingFinalLabel.frame = CGRectMake(frame.width * (1 - Tool.ret_width), frame.height * (Tool.imageView_height - Tool.ret_height), frame.width * Tool.ret_width, frame.height * Tool.ret_height)
        ratingFinalLabel.text = String.init(format: "%.1f", rat)
        ratingFinalLabel.font = UIFont.systemFontOfSize(15)
        ratingFinalLabel.backgroundColor = Tool.ret_color
        ratingFinalLabel.textAlignment = .Center
        imageView.addSubview(ratingFinalLabel)
        
        
        imageView.frame = CGRectMake(0, 0,Tool.imageView_width * frame.width, Tool.imageView_height * frame.height)
        imageView.sd_setImageWithURL(NSURL.init(string: url))
        imageView.userInteractionEnabled = true
        self.addSubview(imageView)
        
        
        titleLabe.frame = CGRectMake(0,Tool.imageView_height * frame.height, frame.width * Tool.titleLabel_width, frame.height * Tool.titleLabel_height)
        titleLabe.text = title
        titleLabe.font = Tool.titleLabel_font
        titleLabe.textAlignment = .Center
        self.addSubview(titleLabe)
        
        
        buyButton = UIButton.init(type: .System)
        buyButton!.frame = CGRectMake(frame.width * 0.5 * (1 - Tool.buyButton_width), frame.height * (Tool.imageView_height + Tool.titleLabel_height), frame.width * Tool.buyButton_width, frame.height * Tool.buyButton_height)
        buyButton!.setTitle("购票", forState: .Normal)
        buyButton!.backgroundColor = Tool.buyButton_color
        buyButton!.titleLabel?.font = Tool.buyButton_font
        buyButton?.layer.cornerRadius = (frame.height * Tool.buyButton_height) / 2
        buyButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.addSubview(buyButton!)
        buyButton!.addTarget(self, action:#selector(self.btnClick(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    func btnClick(sender:UIButton) -> Void {
        target?.performSelector(action!, withObject: nil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
