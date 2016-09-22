//
//  AdVModel.swift
//  Movie
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class AdVModel: NSObject {
    var img:String?
    var img2:String?
    var url:String?
    static func createModel(dic:NSDictionary) -> AdVModel{
        let model = AdVModel()
        model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
        return model
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//        print()
    }
    
    
}
