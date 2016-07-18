//
//  HomeViewController.swift
//  图片浏览器me
//
//  Created by  汪刚 on 16/7/17.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

private let  resusibleID = "HomeCell"
class HomeViewController: UICollectionViewController {
    private lazy var shops : [Shop] = [Shop]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(0)
    }
    
}


extension HomeViewController {
    func presentPhotoBrowse(indexPath : NSIndexPath){
        let photoBrowserVc = PhotoBrowserController(indexPath: indexPath, shops: shops)
        //2设置浏览器属性
        photoBrowserVc.modalPresentationStyle = .Custom
        photoBrowserVc.modalTransitionStyle = .CrossDissolve
    
        presentViewController(photoBrowserVc, animated: true, completion: nil)
    }
}

extension HomeViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resusibleID, forIndexPath: indexPath) as!HomeViewCell
        cell.shop = shops[indexPath.item]
        if indexPath.item == shops.count - 1 {
            loadData(shops.count)
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        presentPhotoBrowse(indexPath)
    }
}



extension HomeViewController {
    private func loadData(offSet : Int){
        NetWorkingTools.shareInstance.loadHomeData(offSet) {(result ,error) -> Void in
            if error != nil {
                print(error )
                return
            }
            
            //2.判断是否有数据
            var tempShops = [Shop]()
            for dict in result!{
                tempShops.append(Shop(dict: dict))
                
            }
            self.shops += tempShops
            self.collectionView?.reloadData()
        
        }
    }

}



