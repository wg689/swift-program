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
        loadStatus(0)
    }
}

// MARK:- 弹出照片浏览器
extension HomeViewController {
    func presentPhotoBrowser(indexPath : NSIndexPath) {
        // 1.创建照片浏览器
        let photoBrowserVc = PhotoBrowserController(indexPath: indexPath, shops: shops)
        
        // 2.设置照片浏览器属性
        photoBrowserVc.modalPresentationStyle = .Custom
        photoBrowserVc.modalTransitionStyle = .CrossDissolve
        
        // 3.弹出照片浏览器
        presentViewController(photoBrowserVc, animated: true, completion: nil)
    }
}


// MARK:- 数据请求
extension HomeViewController {
    func loadStatus(offSet : Int) {
        NetworkTools.shareIntance.loadHomeStatus(offSet) { (result, error) -> Void in
            // 1.错误校验
            if error != nil {
                print(error)
                return
            }
            
            // 2.判断是否有数据
            var tempShops = [Shop]()
            for dict in result! {
                tempShops.append(Shop(dict: dict))
            }
            self.shops += tempShops
            
            // 3.展示数据
            self.collectionView?.reloadData()
        }
    }
}


// MARK:- CollectionView的数据源和代理方法
extension HomeViewController {
    override func collectionView(colleccolletionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 1.创建Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as! HomeViewCell
        
        // 2.给cell设置数据
        cell.shop = shops[indexPath.item]
        
        // 3.如果是最后一个Cell出现,则加载更多
        if indexPath.item == shops.count - 1 {
            loadStatus(shops.count)
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        presentPhotoBrowser(indexPath)
    }
}