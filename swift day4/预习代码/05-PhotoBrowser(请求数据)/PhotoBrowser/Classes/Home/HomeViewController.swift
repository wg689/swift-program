//
//  HomeViewController.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeViewController: UICollectionViewController {
    // MARK:- 定义属性
    private lazy var shops : [Shop] = [Shop]()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.请求数据
        loadStatus()
    }
}


// MARK:- 数据请求
extension HomeViewController {
    func loadStatus() {
        NetworkTools.shareIntance.loadHomeStatus { (result, error) -> Void in
            // 1.错误校验
            if error != nil {
                print(error)
                return
            }
            
            // 2.判断是否有数据
            for dict in result! {
                self.shops.append(Shop(dict: dict))
            }
            
            // 3.展示数据
            for s in self.shops {
                print(s)
            }
        }
    }
}


// MARK:- CollectionView的数据源和代理方法
extension HomeViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 1.创建Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath)
        
        // 2.给cell设置数据
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
}