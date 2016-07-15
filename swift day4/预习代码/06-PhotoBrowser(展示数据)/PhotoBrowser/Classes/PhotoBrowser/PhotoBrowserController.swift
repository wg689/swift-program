//
//  PhotoBrowserController.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

private let photoBrowserCell = "photoBrowserCell"

class PhotoBrowserController: UIViewController {
    
    // MARK:- 定义属性
    var indexPath : NSIndexPath
    var shops : [Shop]
    
    // MARK:- 懒加载属性
    private lazy var collectionView : UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: PhotoBrowserCollectionLayout())
    private lazy var closeBtn : UIButton = UIButton(title: "关 闭", bgColor: UIColor.darkGrayColor(), fontSize: 14)
    private lazy var saveBtn : UIButton = UIButton(title: "保 存", bgColor: UIColor.darkGrayColor(), fontSize: 14)
    
    // MARK:- 自定义构造函数
    init(indexPath : NSIndexPath, shops : [Shop]) {
        self.indexPath = indexPath
        self.shops = shops
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
}


// MARK:- 设置UI界面内容
extension PhotoBrowserController {
    private func setupUI() {
        // 1.添加子控件
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        // 2.设置子控件的frame
        collectionView.frame = view.bounds
        let screenW = UIScreen.mainScreen().bounds.width
        let screenH = UIScreen.mainScreen().bounds.height
        let btnW : CGFloat = 90
        let btnH : CGFloat = 32
        closeBtn.frame = CGRect(x: 20, y: screenH - btnH - 20, width: btnW, height: btnH)
        saveBtn.frame = CGRect(x: screenW - 20 - btnW, y: screenH - btnH - 20, width: btnW, height: btnH)
        
        // 3.设置collectionView的属性
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: photoBrowserCell)
    }
}


// MARK:- 设置collectionView的数据源和代理
extension PhotoBrowserController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 1.创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photoBrowserCell, forIndexPath: indexPath)
        
        // 2.设置cell的属性
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.orangeColor() : UIColor.purpleColor()
        
        return cell
    }
}
