//
//  PhotoBrowserController.swift
//  图片浏览器me
//
//  Created by HLH on 16/7/18.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
private let photoBrowserCell = "photoBrowserCell"
class PhotoBrowserController:UIViewController{
    var indexPath : NSIndexPath
    var shops:[Shop]
    private lazy var collectionView:UICollectionView =   UICollectionView(frame:CGRectZero,collectionViewLayout:PhotoBrowserCollectionLayout())
    private lazy var closeBtn:UIButton = UIButton(title:"关闭",bgColor:UIColor.darkGrayColor(),fontSize:14)
    
    private lazy var saveBtn :UIButton = UIButton(title:"保存",bgColor:UIColor.darkGrayColor(),fontSize:14)
    
    
   init(indexPath:NSIndexPath,shops:[Shop]){
    self.indexPath = indexPath
    self.shops = shops
    super.init(nibName: nil, bundle: nil)
    }
    required init ?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        setupUI()
    }
    
}


//mark: - 设置UI界面相关的
extension PhotoBrowserController {
    private func setupUI(){
       view.addSubview(collectionView)
       view.addSubview(closeBtn)
       view.addSubview(saveBtn)
        
        //2.设置子控件的frame
        collectionView.frame = view.bounds
        let screenW = UIScreen.mainScreen().bounds.width
        let screenH = UIScreen.mainScreen().bounds.height
        let btnW :CGFloat = 90
        let btnH :CGFloat = 32
        closeBtn.frame = CGRect(x:20,y: screenH - btnH - 20,width:btnW,height:btnH)
        
        //3.设置collectionView的属性
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: photoBrowserCell)
        
    }
}

//mark :- 设置collectionView的数据源和代理

extension PhotoBrowserController: UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return shops.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photoBrowserCell, forIndexPath: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.orangeColor():UIColor.purpleColor()
        return cell

    }
    
    
}





