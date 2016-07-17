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
    override func viewDidLoad() {
        super.viewDidLoad()
    loadData()
        
    }
    
    
    
}

extension HomeViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resusibleID, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
}



extension HomeViewController {
    private func loadData(){
        NetWorkingTools.shareInstance.loadHomeData { (result) -> () in
            let resultDic = result as! [String:NSObject!]
            
            guard let resultArr = resultDic["data"] as?[[NSString:NSObject]]else{
                print("转成字典错误")
                return;
            }
            for dic in resultArr {
                print(dic)
            }
            
        }
    }
}











