//
//  HotCell.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotCell: UITableViewCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    func customCell(model:HotModel) -> Void {
        iconView.sd_setImageWithURL(NSURL.init(string: model.img!))
        titleLabel.text = model.title
        descLabel.text = model.desc
        timeLabel.text = self.makeDate(model.publishTime!)
        
    }
    
    
    func makeDate(time:NSTimeInterval) ->String{
        let date = NSDate.init(timeIntervalSince1970: time)
        let formatter = NSDateFormatter.init()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.stringFromDate(date)
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
