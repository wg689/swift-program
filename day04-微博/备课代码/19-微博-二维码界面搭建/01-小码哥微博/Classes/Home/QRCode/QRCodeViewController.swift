//
//  QRCodeViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
   
    // 底部视图
    @IBOutlet weak var customTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置默认选中第1项
        customTabBar.selectedItem = customTabBar.items![0]
    }
}
