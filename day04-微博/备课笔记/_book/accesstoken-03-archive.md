# 归档 & 解档

## 课程目标

* 对比 OC 的`归档 & 解档`实现
* 利用`归档 & 解档`保存用户信息

* 遵守协议

```swfit
class UserAccount: NSObject, NSCoding
```

* 实现协议方法

```swift
///  解档
func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(access_token, forKey: "access_token")
    aCoder.encodeDouble(expires_in, forKey: "expires_in")
    aCoder.encodeObject(expiresDate, forKey: "expiresDate")
    aCoder.encodeObject(uid, forKey: "uid")
}

///  解档
required init?(coder aDecoder: NSCoder) {
    access_token = aDecoder.decodeObjectForKey("access_token") as! String
    expires_in = aDecoder.decodeDoubleForKey("expires_in")
    expiresDate = aDecoder.decodeObjectForKey("expiresDate") as! NSDate
    uid = aDecoder.decodeObjectForKey("uid") as! String
}
```

* 定义归档路径

```swift
/// 归档路径
private static let accountPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!.stringByAppendingPathComponent("account.plist")
```

* 保存账户信息

```swift
///  保存账户信息
private func saveAccount() {
    NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.accountPath)
}
```

* 加载账户信息

```swift
///  加载账户信息
private class func loadAccount() -> UserAccount? {
    if let account = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? UserAccount {
        // 判断是否过期
        if account.expiresDate.compare(NSDate()) == NSComparisonResult.OrderedDescending {
            return account
        }
    }
    return nil
}
```

* 在 AppDelegate 中增加如下代码

```swift
/// 全局账户信息
var sharedUserAccount = UserAccount.loadAccount()
```

> 由于后续所有网络访问都基于用户账户中的 `access_token`，因此在 `AppDelegate` 中定义一个全局变量，从而避免重复加载

* 修改 BaseTableViewController 中的用户是否登录判断

```swift
/// 用户登录标记
var userLogon = sharedUserAccount != nil
```

* 调整后的加载 Token 代码如下：

```swift
///  加载 AccessToken
///
///  * param: params 请求参数字典
class func loadAccessToken(params: [String: String], finished:(account: UserAccount?, error: NSError?) -> ()) {

    NetworkTools.sharedNetworkTools().POST("https://api.weibo.com/oauth2/access_token", parameters: params, success: { (_, JSON) in

            let account = UserAccount(dict: JSON as! [String: NSObject])
            // 归档保存账户信息
            NSKeyedArchiver.archiveRootObject(account, toFile: UserAccount.accountPath)

            finished(account: account, error: nil)
        }) { (_, error) in
            print(error)
            finished(account: nil, error: error)
    }
}
```

* `OAuthViewController` 中的完成回调

```swift

```
