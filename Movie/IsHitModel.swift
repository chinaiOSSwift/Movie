//
//  IsHitModel.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class IsHitModel: NSObject {
    var movieId:Int? // ID
    var titleCn:String?
    var commonSpecial:String?
    var rYear:Int?
    var rMonth:Int?
    var rDay:Int?
    var nearestCinemaCount:Int? // 多少家
    var nearestShowtimeCount:Int? // 多少场
    var img:String?
    var ratingFinal:Float?
    var type:String? //类型
    static func createModel(dic:NSDictionary) -> IsHitModel{
        let model = IsHitModel()
        model.movieId = (dic["movieId"] as? NSNumber)?.integerValue
        model.titleCn = (dic["titleCn"] as? String)
        model.commonSpecial = dic["commonSpecial"] as? String
        model.rYear = (dic["rYear"] as! NSNumber).integerValue
        model.rMonth = (dic["rMonth"] as! NSNumber).integerValue
        model.rDay = (dic["rDay"] as! NSNumber).integerValue
        model.nearestCinemaCount = ((dic["nearestShowtime"] as! NSDictionary)["nearestCinemaCount"] as! NSNumber).integerValue
        model.nearestShowtimeCount = ((dic["nearestShowtime"] as! NSDictionary)["nearestShowtimeCount"] as! NSNumber).integerValue
        model.img = dic["img"] as? String
        model.ratingFinal = (dic["ratingFinal"] as! NSNumber).floatValue
        model.type = dic["type"] as? String
        return model
    }
    
}
