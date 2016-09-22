//
//  HotModel.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotModel: NSObject {
    var id:Int?
    var title:String?
    var desc:String?
    var img:String?
    var publishTime:NSTimeInterval?
    var commentCount:Int?
    static func createModel(dic:[String:AnyObject]) -> HotModel{
        let model = HotModel()
        model.id = (dic["id"] as! NSNumber).integerValue
        model.title = dic["title"] as? String
        model.desc = dic["desc"] as? String
        model.img = dic["img"] as? String
        model.publishTime = (dic["publishTime"] as! NSNumber).doubleValue
        model.commentCount = (dic["commentCount"] as! NSNumber).integerValue
        return model
    }
    
}
