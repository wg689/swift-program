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
    override func loadView() {
        super.loadView()
        
        view.frame.size.width += 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
        // 滚到正确的位置
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
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
        collectionView.registerClass(PhotoBrowserViewCell.self, forCellWithReuseIdentifier: photoBrowserCell)
        
        // 4.监听按钮的点击
        closeBtn.addTarget(self, action: "closeBtnClick", forControlEvents: .TouchUpInside)
        saveBtn.addTarget(self, action: "saveBtnClick", forControlEvents: .TouchUpInside)
    }
}


// MARK:- 事件监听函数
extension PhotoBrowserController {
    @objc private func closeBtnClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func saveBtnClick() {
        // 1.获取当前cell
        let cell = collectionView.visibleCells().first as! PhotoBrowserViewCell
        
        // 2.获取cell中的图片
        let image = cell.imageView.image!
        
        // 3.保存图片
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}


extension PhotoBrowserController : dismissAnimatorDelegate {
    func indexPathOfCell() -> NSIndexPath {
        // 1.取出正在显示的cell
        let cell = (collectionView.visibleCells().first)!
        let indexPath = collectionView.indexPathForCell(cell)!
        
        return indexPath
    }
    
    func imageView() -> UIImageView {
        let cell = collectionView.visibleCells().first as! PhotoBrowserViewCell
        
        let imageView = cell.imageView
        
        let animateView = UIImageView(image: imageView.image)
        animateView.frame = imageView.frame
        
        animateView.contentMode = .ScaleAspectFill
        animateView.clipsToBounds = true
        
        return animateView
    }
}

// MARK:- 设置collectionView的数据源和代理
extension PhotoBrowserController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 1.创建cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photoBrowserCell, forIndexPath: indexPath) as! PhotoBrowserViewCell
        
        // 2.设置cell的属性
        cell.shop = shops[indexPath.item]
        
        return cell
    }
}
