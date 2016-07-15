//
//  HomeCollectionViewLayout.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class HomeCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        super.prepareLayout()
        
        // 0.定义常量
        let itemMargin : CGFloat = 10
        let cols : CGFloat = 3
        let itemWH = (UIScreen.mainScreen().bounds.width - (cols + 1) * itemMargin) / cols
        
        // 1.设置布局属性
        itemSize = CGSize(width: itemWH, height: itemWH)
        minimumInteritemSpacing = itemMargin
        minimumLineSpacing = itemMargin
        
        // 2.设置collectionView的内边距
        collectionView?.contentInset = UIEdgeInsets(top: 64 + itemMargin, left: itemMargin, bottom: itemMargin, right: itemMargin)
    }
}
