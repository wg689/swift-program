//
//  FriendGroupViewController.swift
//  XMGWeibo
//
//  Created by 李南江 on 15/9/1.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class FriendGroupViewController: UIViewController , UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let identifer:String = "customCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 如果设置了空一个控件的frame或size之后, 大小不对, 那么可以尝试禁止autoresizing
//        view.autoresizingMask = UIViewAutoresizing.None
//        tableView.autoresizingMask = UIViewAutoresizing.None

    }
 
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell")!
        cell.textLabel!.text = "我是第 \(indexPath.row) 行"
        return cell
    }
}