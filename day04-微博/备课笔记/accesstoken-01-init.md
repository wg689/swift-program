# UserAccount 模型

## 课程目标

* 加载网络数据
* 简单的字典转模型
* 调试模型信息

## 加载 AccessToken

* 在 `OAuthViewController` 中增加以下代码

```swift
///  加载访问令牌
///
///  * param: code 授权码
private func loadAccessToken(code: String) {

    let params = ["client_id": WB_Client_ID,
        "client_secret": WB_Client_Secret,
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": WB_Redirect_URI]

    UserAccount.loadAccessToken(params)
}
```

* 新建 `UserAccount` 类
* 建立类函数加载 Token

```swift
///  加载 AccessToken
///
///  * param: params 请求参数字典
class func loadAccessToken(params: [String: String]) {
    NetworkTools.sharedNetworkTools().POST("https://api.weibo.com/oauth2/access_token", parameters: params, success: { (_, JSON) in
        print(JSON)
        }) { (_, error) in
            print(error)
    }
}
```

> 运行测试

* 返回错误信息

```
Error Domain=com.alamofire.error.serialization.response Code=-1016 "Request failed: unacceptable content-type: text/plain"
```

* 在 `NetworkTools` 中增加反序列化数据格式

```swift
// 设置反序列化数据格式集合
tools.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as! Set<String>
```

> 运行测试

* 定义模型属性

```swift
/// 用于调用access_token，接口获取授权后的access token
var access_token: String
/// access_token的生命周期，单位是秒数
var expires_in: String
/// 当前授权用户的UID
var uid: String

init(dict: [String: String]) {
    access_token = dict["access_token"]!
    expires_in = dict["expires_in"]!
    uid = dict["uid"]!
}
```

* 字典转模型

```swift
let account = UserAccount(dict: JSON as! [String: AnyObject])
println(account)
```

* 运行测试程序会崩溃！

> 因为从新浪服务器返回的 `expires_in` 是整数而不是字符串

* 调整代码，验证 `expires_in` 数据类型

```swift
import AFNetworking

class func loadAccessToken(params: [String: String]) {

    NetworkTools.sharedNetworkTools().responseSerializer = AFHTTPResponseSerializer()

    NetworkTools.sharedNetworkTools().POST("https://api.weibo.com/oauth2/access_token", parameters: params, success: { (_, JSON) in

        print(NSString(data: JSON as! NSData, encoding: NSUTF8StringEncoding))
        }) { (_, error) in
            print(error)
    }
}
```

* 修改字典转模型函数

```swift
init(dict: [String: NSObject]) {
    access_token = dict["access_token"] as! String
    expires_in = dict["expires_in"] as! NSTimeInterval
    uid = dict["uid"] as! String
}
```

> 再次运行测试

### 调试模型信息

* 与 OC 不同，如果要在 Swift 1.2 中调试模型信息，需要遵守 `Printable` 协议，并且重写 `description` 的 `getter` 方法，在 Swift 2.0 中，`description` 属性定义在 `CustomStringConvertible` 协议中

```swift
override var description: String {
    let properties = ["access_token", "expires_in", "uid"]
    return "\(dictionaryWithValuesForKeys(properties))"
}
```

> 目前的版本需要先遵守 `CustomStringConvertible` 协议，重写了 `description` 属性后，再删除，相信后续版本中会得到改进





