//
//  HomeTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogon
        {
            visitorView?.setupVisitorInfo(nil, title: "关注一些人，回这里看看有什么惊喜")
            return
        }
    }
}
