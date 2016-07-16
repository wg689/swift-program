# 界面切换

## 界面切换流程图

![](./images/新特性/界面切换流程图.png)

## 代码实现

### AppDelegate

* 判断新版本

```swift
///  检查是否新更新版本
private func isNewUpdate() -> Bool {
    // 1. 获取当前版本信息
    let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
    let version = NSNumberFormatter().numberFromString(currentVersion)?.doubleValue ?? 0

    // 2. 获取沙盒版本信息
    let versionKey = "versionKey"
    let sandboxVersion = NSUserDefaults.standardUserDefaults().doubleForKey(versionKey)

    // 3. 将版本写入沙盒
    NSUserDefaults.standardUserDefaults().setDouble(version, forKey: versionKey)

    return version > sandboxVersion
}
```

* 要显示的默认控制器

```swift
/// 要显示的默认控制器
private func defaultController() -> UIViewController {
    // 判断用户是否登录
    if sharedUserAccount != nil {
        return isNewUpdate() ? NewFeatureViewController() : WelcomeViewController()
    }
    return MainViewController()
}
```

* 应用程序启动

```swift
window?.rootViewController = defaultController()
```

### 多视图控制器切换

#### 定义通知

* 在 `AppDelegate` 中定义通知常量

```swift
/// 界面切换通知
let HMSwitchMainInterfaceNotification = "HMSwitchMainInterfaceNotification"
```

* 注册通知

```swift
// 注册通知
NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchRootViewController", name: HMSwitchMainInterfaceNotification, object: nil)
```

* 切换根视图控制器

```swift
///  切换根视图控制器
func switchRootViewController(n: NSNotification) {
    let isMain = n.object as! Bool
    window?.rootViewController = isMain ? MainViewController() : WelcomeViewController()
}

```

#### 欢迎界面

```swift
NSNotificationCenter.defaultCenter().postNotificationName(HMSwitchMainInterfaceNotification, object: true)
```

#### 新特性界面

```swift
NSNotificationCenter.defaultCenter().postNotificationName(HMSwitchMainInterfaceNotification, object: true)
```

#### OAuth 用户登录

* 在 `AccessToken` 中增加闭包回调

```swift
NSNotificationCenter.defaultCenter().postNotificationName(HMSwitchMainInterfaceNotification, object: false)

self.dismissViewControllerAnimated(true, completion: nil)
```
