//
//  MessageTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class MessageTableViewController: VisitorTableTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogon
        {
            visitorView?.setupVisitorInfo("visitordiscover_image_message", title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
            return
        }
    }

}
