# 加载用户信息

## 课程目标

* 通过 `AccessToken` 获取新浪微博网络数据

## 接口定义

### 文档地址

http://open.weibo.com/wiki/2/users/show

### 接口地址

https://api.weibo.com/2/users/show.json

### HTTP 请求方式

* GET

### 请求参数

| 参数 | 描述 |
| -- | -- |
| access_token | 采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得 |
| uid | 需要查询的用户ID |

### 返回数据

| 返回值字段 | 字段说明 |
| -- | -- |
| name | 友好显示名称 |
| avatar_large | 用户头像地址（大图），180×180像素 |

### 测试 URL

https://api.weibo.com/2/users/show.json?access_token=2.00ml8IrF0qLZ9W5bc20850c50w9hi9&uid=5365823342

## 代码实现

### 增加属性定义

```swift
/// 友好显示名称
var name: String?
/// 用户头像地址（大图），180×180像素
var avatar_large: String?
```

### 添加方法加载用户信息

```swift
///  加载用户信息
func loadUserInfo() {

    let params = ["access_token": access_token, "uid": uid]

    NetworkTools.sharedNetworkTools().GET("2/users/show.json", parameters: params, success: { (_, JSON) in
        print(JSON)
        }) { (_, error) in
            print(error)
    }
}
```

* 修改 `description` 属性

```swift
let properties = ["access_token", "expires_in", "uid", "expiresDate", "name", "avatar_large"]
```

* 修改归档&解档函数，增加用户名和图像地址属性

```swift
///  解档
func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(access_token, forKey: "access_token")
    aCoder.encodeDouble(expires_in, forKey: "expires_in")
    aCoder.encodeObject(expiresDate, forKey: "expiresDate")
    aCoder.encodeObject(uid, forKey: "uid")
    aCoder.encodeObject(name, forKey: "name")
    aCoder.encodeObject(avatar_large, forKey: "avatar_large")
}

///  解档
required init?(coder aDecoder: NSCoder) {
    access_token = aDecoder.decodeObjectForKey("access_token") as! String
    expires_in = aDecoder.decodeDoubleForKey("expires_in")
    expiresDate = aDecoder.decodeObjectForKey("expiresDate") as! NSDate
    uid = aDecoder.decodeObjectForKey("uid") as! String
    name = aDecoder.decodeObjectForKey("name") as? String
    avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
}
```

* 增加闭包回调

```swift
///  加载用户信息
func loadUserInfo(finished:(account: UserAccount?, error: NSError?) -> ()) {

    let params = ["access_token": access_token, "uid": uid]

    NetworkTools.sharedNetworkTools().GET("2/users/show.json", parameters: params, success: { (_, JSON) in
        print(JSON)

        let dict = JSON as! [String: AnyObject]
        self.name = dict["name"] as? String
        self.avatar_large = dict["avatar_large"] as? String

        // 归档保存账户信息
        NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.accountPath)

        finished(account: self, error: nil)

        }) { (_, error) in
            finished(account: nil, error: error)
    }
}
```

* 修改 `loadAccessToken` 方法

```swift
// 3. 发起网络请求
NetworkTools.sharedNetworkTools().POST(urlString, parameters: params, success: { (_, JSON) -> Void in

    // 加载用户信息
    UserAccount(dict: JSON as! [String : AnyObject]).loadUserInfo() { (account, error) in

        if account != nil {
            sharedUserAccount = account
            return
        }
        print(error)
        SVProgressHUD.showInfoWithStatus("您的网络不给力")
    }

    }) { (_, error) in
        print(error)
        SVProgressHUD.showInfoWithStatus("您的网络不给力")
}
```

> 每一个令牌授权一个 `特定的网站` 在 `特定的时段内` 访问 `特定的资源`
