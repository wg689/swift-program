//
//  HomeCollectionViewLayout.swift
//  图片浏览器me
//
//  Created by  汪刚 on 16/7/17.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
class HomeCollectionViewLayout:UICollectionViewFlowLayout{
    override func prepareLayout() {
        super.prepareLayout()
        //1.定义和计算常量
        let margin:CGFloat = 10.0
        let cols: CGFloat = 3
        let itemH = (UIScreen.mainScreen().bounds.width - (cols + 1) * margin)/cols
        //设置布局
        
        // 1.设置布局
        
    itemSize = CGSize(width: itemH, height: itemH)
      minimumInteritemSpacing = margin
        minimumLineSpacing = margin
    collectionView?.contentInset = UIEdgeInsetsMake(64, margin
    , 0, margin)
    }
}