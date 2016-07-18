
//
//  HomeViewCell\.swift
//  图片浏览器me
//
//  Created by HLH on 16/7/18.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
import SDWebImage
class HomeViewCell:UICollectionViewCell{
    var shop:Shop?{
        didSet {
            //1.获取URl对应的字符串
            guard let urlString = shop?.q_pic_url else {
                return
            }
            //2.创建URl
            let url = NSURL(string: urlString)
//            3.设置图片
            image.sd_setImageWithURL(url, placeholderImage: UIImage(named: "empty_picture"), options: [.LowPriority,.RetryFailed])
            
        }
    }
    @IBOutlet weak var image: UIImageView!
}




