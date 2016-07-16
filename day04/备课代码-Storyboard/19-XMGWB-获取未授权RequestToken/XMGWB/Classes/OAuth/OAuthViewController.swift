//
//  OAuthViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/11/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 1. 添加导航条按钮
        setupNav()
        
        // 2. 获取未授权的RequestToken(登录界面)
        loadPage()
    }

    // MARK: - 内部控制方法
    /// 初始化导航条
    private func setupNav()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("closeBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("rightBtnClick"))
    }
    
    /// 加载登录界面
    private func loadPage()
    {
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_App_Key)&redirect_uri=\(WB_Redirect_URI)"
        
        guard let url = NSURL(string: urlStr) else
        {
            return
        }
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    /// 监听关闭按钮点击
    @objc private func closeBtnClick()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// 监听填充按钮点击
    @objc private func rightBtnClick()
    {
        let js = "document.getElementById('userId').value='58899986@qq.com';" + "document.getElementById('passwd').value='';"
        webView.stringByEvaluatingJavaScriptFromString(js)
    }

}
