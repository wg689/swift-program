# 欢迎界面

* 在新浪微博中，如果用户登录成功会显示一个欢迎界面
* 特例：如果用户的系统刚刚升级或者第一次登录，会显示 `新特性` 界面，而不是 `欢迎`界面

### 准备文件

* 在 `NewFeature` 目录下新建 `WelcomeViewController.swift` 继承自 `UIViewController`
* 新建 `Welcome.storyboard`，初始视图控制器的自定义类为 `WelcomeViewController`

### 代码实现

* 修改 `AppDelegate` 的根视图控制器

```swift
window?.rootViewController = WelcomeViewController()
```

* 搭建界面

```swift
var bottomConstaint: NSLayoutConstraint?

// MARK: - 界面设置
/**
    初始化UI
    */
    private func setupUI()
    {
        // 1.添加子控件
        view.addSubview(bgImageView)
        view.addSubview(iconView)
        view.addSubview(message)

        // 2.布局子控件
        // 2.1约束背景
        bgImageView.xmg_Fill(view)

        // 2.2约束头像
        let cons = iconView.xmg_AlignInner(type: XMG_AlignType.BottomCenter, referView: view, size: CGSize(width: 100, height: 100), offset: CGPoint(x: 0, y: -200))
        // 记录底部约束
        iconBottomCons = iconView.xmg_Constraint(cons, attribute: NSLayoutAttribute.Bottom)

        // 2.3约束文字
        message.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: iconView, size: nil, offset: CGPoint(x: 0, y: 20))
    }
    // MARK: - 懒加载
    /// 背景图片
    private lazy var bgImageView: UIImageView = UIImageView(image:UIImage(named:"ad_background"))
    ///  头像
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "avatar_default_big"))
        iv.layer.cornerRadius = 50
        iv.layer.masksToBounds = true
        return iv
        }()
    /// 消息文字
    private lazy var message: UILabel = {
        let label = UILabel()
        label.text = "欢迎归来"
        label.alpha = 0.0
        label.sizeToFit()
        return label
        }()
```

* 界面动画

```swift
override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // 提示：修改约束不会立即生效，添加了一个标记，统一由自动布局系统更新约束
        iconBottomCons?.constant = -UIScreen.mainScreen().bounds.height - iconBottomCons!.constant
        print( -UIScreen.mainScreen().bounds.height)
        print(iconBottomCons!.constant)

        UIView.animateWithDuration(1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            // 强制更新约束
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
                UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
                    self.message.alpha = 1.0
                    }, completion: { (_) -> Void in
                        print("OK")
                })
        }
    }
```

* `usingSpringWithDamping` 的范围为 `0.0f` 到 `1.0f`，数值越小 `弹簧` 的振动效果越明显
* `initialSpringVelocity` 则表示初始的速度，数值越大一开始移动越快，初始速度取值较高而时间较短时，会出现反弹情况

#### 使用

* 在 `WelcomeViewController` 中的 `viewDidLoad` 函数中设置用户头像

```swift
override func viewDidLoad() {
    super.viewDidLoad()

   // 2.设置用户信息
        if let iconUrlStr = UserAccount.loadAccount()?.avatar_large{
            // 更新图像，会自动更新imageView的大小
            iconView.sd_setImageWithURL(NSURL(string: iconUrlStr))
        }
}
```
