# 设置过期日期

## 过期日期

* 在新浪微博返回的数据中，过期日期是以当前系统时间加上秒数计算的，为了方便后续使用，增加过期日期属性

* 定义属性

```swift
/// 过期日期
var expiresDate: NSDate
```

* 修改构造函数

```swift
expiresDate = NSDate(timeIntervalSinceNow: expires_in)
```

* 修改 `description`

```swift
let properties = ["access_token", "expires_in", "expiresDate", "uid"]
```

