//
//  MyConnection.swift
//  Movie
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MyConnection: NSObject {

    // 用来记录网络连接的对象
    var connection:NSURLConnection?
    // 记录下载的数据
    var downLoadData = NSMutableData()
    // 记录网址
    var urlStr:String?
    // 1. 用来记录回调的对象 2. 用来记录回调的方法
    var target:AnyObject?
    var action:Selector?
    
    // 记录下载的状态
    var isFinish:Bool = false
    // 构造方法
    init(urlStr:String,target:AnyObject,action:Selector) {
        
        self.urlStr = urlStr
        self.target = target
        self.action = action
    }
    func start() -> Void {
        let url = NSURL.init(string: urlStr!)
        
        let request = NSURLRequest.init(URL: url!)
        //开启小菊花
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        connection = NSURLConnection.init(request:request, delegate: self)
        connection?.start()
    }
    func stop() -> Void {
        connection?.cancel()
    }
}
extension MyConnection:NSURLConnectionDataDelegate{
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        downLoadData.length = 0
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        downLoadData.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        isFinish = true
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        target?.performSelector(action!, withObject: self)
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        isFinish = false
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        target?.performSelector(action!, withObject: self)
    }
}




















