//
//  MainCell.swift
//  NoName
//
//  Created by BigHead on 14-6-16.
//  Copyright (c) 2014年 BigHead. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet var backgroundImage : UIImageView

    @IBOutlet var titleLabel : UILabel
    
    @IBOutlet var subtitleLabel : UILabel
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    
}
