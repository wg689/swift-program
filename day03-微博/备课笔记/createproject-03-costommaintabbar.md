# 自定义 TabBar

## 功能需求

* 在 4 个控制器切换按钮中间增加一个撰写按钮
* 点击撰写按钮能够弹出对话框撰写微博

### 需求分析

* 添加占位控制器
* 计算控制器按钮位置，在中间添加一个 `撰写` 按钮

### 添加占位控制器

```swift
    /**
    添加所有子控制
    */
    private func addChildViewControllers()
    {
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")

            addChildViewController("NullViewController", title: "", imageName: "")

            addChildViewController("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
    }
```

### 撰写按钮懒加载

```swift
    /// 加号按钮
    private lazy var composeBtn:UIButton = {

        // 1.创建按钮
        let button = UIButton()

        // 2.设置图片
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)

        // 3.设置背景图片
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)

        // 4.调整按钮大小
        button.sizeToFit()

        // 5.返回按钮
        return button
    }()
```

* 先测试代码的可行性，再来细化 UI

### 调整界面布局
* 在 `MainViewController` 中添加以下代码，并且增加断点

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    addChildViewControllers()

    // The tab bar view associated with this controller. (read-only)
    print(tabBar)
    print(tabBar.items)
}

override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    print(__FUNCTION__)
    print(tabBar.items)
}
```

* 运行测试，通过调用堆栈观察可以发现

* viewDidLoad 方法调用是实例化控制器方法触发的

![](./images/TabBar/viewdidload调用.png)

* 此时只是创建子控制器，而由于界面还没有显示，按照 iOS 开发的延迟创建原则，tabBar 中的 items 还没有被创建

* viewWillAppear 方法是由 `makeKeyAndVisible` 方法触发的
![](./images/TabBar/viewwillappear调用.png)

* 此时需要开始准备将控制器的子视图添加到界面上，因此 tabBar 中的 items 已经被创建

* 因此可以考虑在 viewWillAppear 方法中 计算加号按钮位置

### 计算 `撰写按钮` 的位置
```swift
    /**
    设置加号按钮位置
    */
    func setupComposetButton() {

        // 1. 添加按钮
        tabBar.addSubview(composeBtn)

        // 2. 调整按钮
//        let count = childViewControllers.count
        // 让按钮宽一点点，能够解决手指触摸的容错问题
//        let w = tabBar.bounds.width / CGFloat(count)
//        composeBtn.frame = CGRectInset(tabBar.bounds, 2 * w, 0)

        // Swift可以直接修改对象的结构体属性的成员
        composeBtn.center.x = tabBar.center.x

        // 4.监听加号按钮点击
        composeBtn.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
    }
```

### 撰写按钮点击处理

```swift
    //  运行循环监听到事件后，向 VC 发送消息，动态执行 方法，因此不能设置为 private
    // 如果我们确定使用这些内容的动态特性的话，我们需要手动给它们加上 @objc 修饰
    @objc private func composeBtnClick(){
        NJLog("")
    }
```

+ 访问权限
    * public:
        *  Framework 是可以被任何人使用的，你可以将其设置为 public 级别
    * internal:
        * app 或 Framework 的内部结构使用 internal 级别
    * private:
        * 只能在当前源文件中使用的实体。使用 private 级别，可以隐藏某些功能的特地的实现细节
        * `不希望暴露`的方法，应该使用 private 修饰符

+   为了提升性能了,Swift会在`编译时`确定的方法和属性, 如果想让Swift支持OC的`动态派发`那么必须在前面加上@objc


> 注意：
    * 添加 @objc 修饰符并不意味着这个方法或者属性会变成动态派发，Swift 依然可能会将其优化为静态调用
    * 如果你需要和 Objective-C 里动态调用时相同的运行时特性的话，你需要使用的修饰符是 dynamic

---
### 指定构造器和便利构造器
+ 指定构造器
    + 指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性
    + 每一个类都必须拥有至少一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件

+ 便利构造器
    + 便利构造器是类中比较次要的、辅助型的构造器
    + 用于快速构造一个对象, 一般用于给系统类新增快速创建方法
    + 你应当只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器，能够节省更多开发时间并让类的构造过程更清晰明了

+ 类的构造器代理规则
    + `指定构造器`必须调用其`直接父类`的的`指定构造器`
    + `便利构造器`必须调用`同一类`中定义的`其它构造器`
    + `便利构造器`必须`最终`导致一个`指定构造器`被调用

![](images/initializer.png)
