//
//  PhotoBrowserCollectionLayout.swift
//  图片浏览器me
//
//  Created by HLH on 16/7/18.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
class PhotoBrowserCollectionLayout:UICollectionViewFlowLayout{
    override func prepareLayout() {
        super.prepareLayout()
        itemSize = collectionView!.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        collectionView?.pagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        
        
    }
    
    
    
    
    
}