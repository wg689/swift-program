//
//  HomeViewCell.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewCell: UICollectionViewCell {
    // MARK:- 定义属性
    var shop : Shop? {
        didSet {
            // 1.获取URL对应的字符串
            guard let urlString = shop?.q_pic_url else {
                return
            }
            
            // 2.创建URL
            let url = NSURL(string: urlString)
            
            // 3.设置图片
            imageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "empty_picture"), options: [.LowPriority, .RetryFailed])
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var imageView: UIImageView!
}
