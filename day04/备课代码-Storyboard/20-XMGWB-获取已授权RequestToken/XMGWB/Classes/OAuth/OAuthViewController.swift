//
//  OAuthViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/11/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
import SVProgressHUD

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


// MAKR: - UIWebViewDelegate
extension OAuthViewController: UIWebViewDelegate
{
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.showInfoWithStatus("正在加载ing...", maskType: SVProgressHUDMaskType.Black)
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        closeBtnClick()
    }
    
    /*
    webView的该代理方法用于控制是否允许发起请求
    */
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 1.判断是否是授权回调页面
        guard  let urlStr = request.URL?.absoluteString where urlStr.hasPrefix(WB_Redirect_URI) else
        {
            return true
        }
        
        // 2.判断是否授权成功
        guard !urlStr.containsString("?error_uri=") else
        {
            SVProgressHUD.showErrorWithStatus("授权失败", maskType: SVProgressHUDMaskType.Black)
            return false
        }
        
        // 3.授权成功, 截取code=后面的内容
        if let str = request.URL?.query
        {
            // 3.1截取code=后面的字符串
            let code = str.substringFromIndex("code=".endIndex)
            
            print(code)
        }
        
        return false
    }
}
