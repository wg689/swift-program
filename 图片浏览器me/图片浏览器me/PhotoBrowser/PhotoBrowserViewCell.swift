//
//  PhotoBrowserViewCell.swift
//  图片浏览器me
//
//  Created by HLH on 16/7/18.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
import SDWebImage
class PhotoBrowserViewCell:UICollectionViewCell {
    var shop :Shop?{
        didSet {
            guard let urlString = shop?.q_pic_url else {
                return
            }
            var smalllImage = SDWebImageManager.sharedManager().imageCache.imageFromDiskCacheForKey(urlString)
            if smalllImage == nil {
//                smalllImage = UIImage(named: "empty_picture"))
            }
            
            
        }
    }
}


// MARK :自定义方法
extension PhotoBrowserViewCell {
    private func calculateImageViewFrame(image:UIImage){
        let imageViewW = UIScreen.mainScreen().bounds.width
        let imageViewH = imageViewW/image.size.width * image.size.height
        let x:CGFloat = 0
        var y:CGFloat = 0
        if imageViewH <= UIScreen.mainScreen().bounds.height{
            y = (UIScreen.mainScreen().bounds.height - imageViewH) * 0.5
        }else {
            y = 0
        }
        
        //设置frame
        imageView.frame = 
    }
}
