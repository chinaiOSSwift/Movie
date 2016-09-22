//
//  MovieModel.swift
//  Movie
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MovieModel: NSObject {
    var actorName1:String?
    var actorName2:String?
    var directorName:String?
    var commonSpecial:String?
    var img:String?
    var length:Int? // Int
    var movieId:Int? // Int
    var titleCn:String?
    var type:String?
    var ratingFinal:Float? // float
    

    
    static func modelWith(dic:NSDictionary) ->MovieModel{
        let model = MovieModel()
        model.actorName1 = dic["actorName1"] as? String
        model.actorName2 = dic["actorName2"] as? String
        model.directorName = dic["directorName"] as? String
        model.commonSpecial = dic["commonSpecial"] as? String
        model.img = dic["img"] as? String
//        print("dic[length] = \(dic["length"] as! NSNumber)")
        model.length = (dic["length"] as! NSNumber).integerValue
        model.movieId = (dic["movieId"] as! NSNumber).integerValue
        model.titleCn = dic["titleCn"] as? String
        model.type = dic["type"] as? String
        model.ratingFinal = (dic["ratingFinal"] as! NSNumber).floatValue
        return model

    }
    
 
    /*
    static func modelWith(dic:[String:AnyObject]) -> MovieModel{
        let model = MovieModel()
        model.setValuesForKeysWithDictionary(dic)
        return model
    }
    
    */
    
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("key = \(key)")
    }
    
}





















