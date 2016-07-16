# 加载授权页面

## 功能需求

* 通过浏览器访问新浪授权页面，获取授权码

### 接口文档

http://open.weibo.com/wiki/Oauth2/authorize

* 测试授权 URL

https://api.weibo.com/oauth2/authorize?client_id=479651210&redirect_uri=http://itheima.com

> 注意：回调地址必须与注册应用程序保持一致

## 功能实现

### 准备工作

* 新建 `OAuth` 文件夹
* 新建 `OAuthViewController.swift` 继承自 `UIViewController`

#### 加载 OAuth 视图控制器

* 修改 `BaseTableViewController` 中用户登录部分代码

```swift
///  用户登录
func visitorLoginButtonClicked() {
    let oauth = OAuthViewController()
    let nav = UINavigationController(rootViewController: oauth)

    presentViewController(nav, animated: true, completion: nil)
}
```

* 在 `OAuthViewController` 中添加以下代码

```swift
lazy var webView: UIWebView = {
    return UIWebView()
}()

override func loadView() {
    view = webView

    title = "小码哥微博"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
}

///  关闭
func close() {
    dismissViewControllerAnimated(true, completion: nil)
}
```

> 运行测试

### 加载授权页面

* 定义常量

```swift
private let WB_Client_ID        = "940792379"
private let WB_Redirect_URI     = "http://www.520it.com"
```

* 加载授权页面

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    loadAuthPage()
}

///  加载授权页面
private func loadAuthPage() {
    let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_Client_ID)&redirect_uri=\(WB_Redirect_URI)"
    let url = NSURL(string: urlString)!
    let request = NSURLRequest(URL: url)

    webView.loadRequest(request)
}
```

> 运行测试，控制台会输出 App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.

这是 Xcode 7.0 升级后，为保证网络安全，增加了一个 ATS(应用程序传输安全)的限定，要求客户端尽量访问 https 资源以保证信息安全。要解决这一问题，可以在 Info.plist 中增加以下内容：

```plist
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
      <true/>
</dict>
```

> 再次运行测试

### 处理重定向地址

* 实现代理方法，跟踪重定向 URL

```swift
// MARK: - UIWebView 代理方法
func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    print(request)

    return true
}
```

#### 输出结果

* 点击注册按钮

http://weibo.cn/dpool/ttt/h5/reg.php?wm=4406&appsrc=18B4ET&backURL=https%3A%2F%2Fapi.weibo.com%2F2%2Foauth2%2Fauthorize%3Fclient_id%3D708836047%26response_type%3Dcode%26display%3Dmobile%26redirect_uri%3Dhttp%253A%252F%252Fitcast.cn%26from%3D%26with_cookie%3D

* 登录成功

https://api.weibo.com/oauth2/authorize

* 换个账号

URL: http://login.sina.com.cn/sso/logout.php?entry=openapi&r=https%3A%2F%2Fapi.weibo.com%2Foauth2%2Fauthorize%3Fclient_id%3D708836047%26redirect_uri%3Dhttp%3A%2F%2Fitcast.cn
...

* 取消授权

http://itcast.cn/?error_uri=%2Foauth2%2Fauthorize&error=access_denied&error_description=user%20denied%20your%20request.&error_code=21330

* 授权

URL: http://itcast.cn/?code=bd5e6060320e46e8022748075697c067

#### 结果分析

* 如果 URL 以 `http://www.520it.com` 开始，需要检查查询参数
* 其他 URL 均加载

#### 代码实现

```swift
func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
     {
        // 0. 获取URL的完整字符串
        let urlStr = request.URL?.absoluteString
        // 1.如果不是回调的 URL，就继续加载
        if !urlStr!.hasPrefix(WB_REDIRECT_URL)
        {
            return true
        }
        // 2.如果是回调地址，需要根据 URL 中的内容，判断是否有授权码
        let query = request.URL?.query
        print(query)
        let codeStr = "code="
        if query!.hasPrefix(codeStr)
        {
             print("有授权Token")
            // 2.1取出code
            let code = query!.substringFromIndex(codeStr.endIndex)
            print("code: \(code)")
        }else
        {
            print("没有未授权Token")
            close()
        }
        return false
    }
```

> 运行测试，会发现如果用户点击了 `取消` 将无法再次 `授权`

* 调整代码如下

```swift
if queryStr.hasPrefix(codeStr) {
    // 授权码
   let code = query!.substringFromIndex(codeStr.endIndex)
    print("授权码 " + code)
} else {
    close()
}
```

### 加载指示器

* 导入 `SVProgressHUD`

```swift
import SVProgressHUD
```

* WebView 代理方法

```swift
func webViewDidStartLoad(webView: UIWebView) {
    SVProgressHUD.show()
}

func webViewDidFinishLoad(webView: UIWebView) {
    SVProgressHUD.dismiss()
}
```

* 关闭

```swift
///  关闭
func close() {
    SVProgressHUD.dismiss()
    dismissViewControllerAnimated(true, completion: nil)
}
```
