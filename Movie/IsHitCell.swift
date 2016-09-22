//
//  IsHitCell.swift
//  Movie
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class IsHitCell: UITableViewCell {

    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PJLabel: UILabel!
    @IBOutlet weak var SYSJLabel: UILabel!
    @IBOutlet weak var scroeLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    func customCell(model:IsHitModel) -> Void {
        iconView.sd_setImageWithURL(NSURL.init(string: model.img!))
        nameLabel.text = model.titleCn
        scroeLabel.text = String.init(format: "%.1f", model.ratingFinal!)
        PJLabel.text = model.commonSpecial
        SYSJLabel.text = String.init(format: "%d月%d日上映",model.rMonth!,model.rDay!)
        infoLabel.text = String.init(format: "今日%d家影院%d场", model.nearestCinemaCount!,model.nearestShowtimeCount!)
        typeLabel.text = model.type
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = 22
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
