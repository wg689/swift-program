//
//  ViewController.swift
//  18-Swift中tableView初体验
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // MARK:- 懒加载的属性
    private lazy var tableView : UITableView = UITableView()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK:- 设置UI界面相关的内容
extension ViewController {
    private func setupUI() {
        // 1.设置frame
        tableView.frame = view.bounds
        
        // 2.设置数据源
        tableView.dataSource = self
        
        // 3.将tableView添加到控制器的View
        view.addSubview(tableView)
    }
}


// MARK:- tableView的数据源方法
extension ViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellID = "CellID"
        
        // 1.从缓存池中取出cell
        var cell = tableView.dequeueReusableCellWithIdentifier(CellID)
        
        // 2.判断是否有值
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: CellID)
        }
        
        // 3.给cell设置数据
        cell?.textLabel?.text = "测试数据:\(indexPath.row)"
        
        return cell!
    }
}

















