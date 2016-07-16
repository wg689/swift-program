//
//  DiscoverTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class DiscoverTableViewController: VisitorTableTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogon
        {
            visitorView?.setupVisitorInfo("visitordiscover_image_message", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
            return
        }
    }

}
