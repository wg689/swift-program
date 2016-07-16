# Popup选项菜单

## 目标

* 点击标题按钮，弹出选项菜单

## 说明

* 为了让功能解藕，弹出表格实际上是一个视图控制器
* 而弹出动作可以利用 `UIPresentationController` 来实现

## 功能实现

* 修改 `HomeTableViewController` 中标题按钮点击事件

```swift
///  点击标题按钮
// MAKR: - 监听按钮点击
    @objc func titleBtnClick(btn: HomeTitleButton){
        // 1.设置按钮状态
        btn.selected = !btn.selected

        // 2.创建Storyoard
        let sb = UIStoryboard(name: "FriendGroup", bundle: nil)
        let vc = sb.instantiateInitialViewController()!

        // 3.显示菜单
        presentViewController(vc, animated: true, completion: nil)
    }
```

* 运行测试
    + 首页控制器View会被挡住并且移除
    + 菜单会填充整个屏幕

<img src="./images/导航栏/准备完成Modal测试.png" width="320" height="578" />


### 使用 UIPresentationController 接管 Modal

#### 第1步：自定义 `UIPresentationController`

* 新建 `PopoverPresentationController` 继承自 `UIPresentationController`
* 重写 init 函数

```swift
class PopoverPresentationController: UIPresentationController {
    /**
    实例化负责转场的控制器

    :param: presentedViewController  被展现的控制器
    :param: presentingViewController 发起转场的控制器, xocde6是nil, xocde7是野指针

    :returns: 负责转场的控制器
    */
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
}
```

#### 第2步：遵守 `UIViewControllerTransitioningDelegate`

* 在 `HomeTableViewController` 中添加 `UIViewControllerTransitioningDelegate` 扩展

```swift
// MAKR: - 自定义转场代理方法
extension HomeTableViewController: UIViewControllerTransitioningDelegate
{
    // 返回负责转场的控制器对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{

        return PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
```

#### 第3步，修改 Modal 代码

```swift
// MAKR: - 监听按钮点击
    @objc func titleBtnClick(btn: HomeTitleButton){
        // 1.设置按钮状态
        btn.selected = !btn.selected

        // 2.创建Storyoard
        let sb = UIStoryboard(name: "FriendGroup", bundle: nil)
        let vc = sb.instantiateInitialViewController()!

        // 3.设置转场代理, 告诉系统谁来负责转场
        vc.transitioningDelegate = self

        // 4.设置转场模式
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom

        // 5.显示菜单
        presentViewController(vc, animated: true, completion: nil)
    }

```

> 运行测试，使用视图层次结构查看前后两种 Modal 的实际运行效果

结论：

* 默认情况下，`Modal` 展现视图控制器会将之前的视图控制器移出
* 而使用 `UIPresentationController` 可以同时保留两个视图控制器的视图，从而能够达到弹窗的效果

> `UIPresentationController` 是 iOS 8.0 新推出的专门封装 Modal 转场动画的控制器

* `UIPresentationController` 的重要概念
    * `containerView` 容器视图
    * `presentedView()` Modal 展现的视图
    * `presentedViewController` Modal 展现的视图控制器

### 设置 Modal 控制器大小

* 在 `PopoverPresentationController` 中重写 `containerViewWillLayoutSubviews` 方法

```swift
///  容器视图将要布局子视图
override func containerViewWillLayoutSubviews() {
    super.containerViewWillLayoutSubviews()

    presentedView().frame = CGRectMake(100, 56, 200, 300)
}
```

> 下一目标 —— 点击空白位置关闭视图控制器

### 点击空白位置关闭视图控制器

* 准备遮罩视图

```swift
/// 遮罩视图
private lazy var dummingView: UIView = {
    let v = UIView()
    v.backgroundColor = UIColor(white: 0, alpha: 0.2)

    let tap = UITapGestureRecognizer(target: self, action: "clickDummingView")
    v.addGestureRecognizer(tap)

    return v
}()

///  点击遮罩视图
func clickDummingView() {
    presentedViewController.dismissViewControllerAnimated(true, completion: nil)
}
```

* 在实例化函数中准备遮罩视图

```swift
override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
    // presentedViewController 是要 Modal 展现的视图控制器
    super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)

    // 准备遮罩视图
    prepareDummingView()
}
```



> `init` 的时候，`containerView` 还没有被创建

* 在 `presentationTransitionWillBegin` 方法中添加遮罩视图
* 此方法是转场开始之前被调用，此时 `containerView` 已经建立

```swift
///  转场开始之前，插入遮罩视图
override func presentationTransitionWillBegin() {
    dummingView.frame = containerView.bounds
    containerView.insertSubview(dummingView, atIndex: 0)
}
```

> 运行测试

* 修改 `clickDumming()` 函数，关闭视图控制器

```swift
///  遮罩视图点击方法
func clickDumming() {
    println(__FUNCTION__)

    // 关闭 Modal 的控制器
    presentedViewController.dismissViewControllerAnimated(true, completion: nil)
}
```

> 下一目标 —— 自定义转场动画

### 自定义转场动画

* 在 `HomeTableViewController` 的 `UIViewControllerTransitioningDelegate` 实现以下方法，指定负责 `展现` 转场动画的对象

```swift
///  指定负责 `展现` 转场动画的对象
func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}
```

* 实现 `UIViewControllerAnimatedTransitioning` 协议方法

```swift
extension HomeTableViewController: UIViewControllerAnimatedTransitioning {

    ///  转场动画时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    ///  自定义转场动画
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    }
}
```

> 运行测试，通过视图层次结构可以看到，一旦实现了以上代理方法，要展现视图的出现需要程序员负责

#### 转场上下文

* `transitionContext` 定义了转场时需要的元数据，比如在转场过程中所参与的视图控制器和视图的相关属性
* 重要属性
    * 来源视图
    * 来源视图控制器
    * 目标视图
    * 目标视图控制器
* 重要方法
    * `completeTransition` 通知转场动画完成

* 自定义转场动画方法

```swift
///  自定义转场动画
func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
    let fromView = fromVC?.view
    let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)

    println("fromVC \(fromVC) toVC \(toVC)")

    if let toView = toVC?.view {
        transitionContext.containerView().addSubview(toView)

        transitionContext.completeTransition(true)
    }
}
```

> 运行测试

#### dismiss 动画

* 在 `HomeTableViewController` 的 `UIViewControllerTransitioningDelegate` 实现以下方法，指定负责 `消失` 转场动画的对象

```swift
///  指定负责 `消失` 转场动画的对象
func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}
```

* 实现了此代理方法之后，同样会调用之前的 `animateTransition` 函数
* 为了更方便地区分是`展现`还是`消失`，可以定义一个属性记录
* 在 `HomeTableViewController` 中定义一个属性

```swift
// 是否展现标记
var isPresenting = false
```

* 在 `展现/消失` 代理函数中增加标记设置

```swift
///  指定负责 `展现` 转场动画的对象
func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = true

    return self
}

///  指定负责 `消失` 转场动画的对象
func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = false

    return self
}
```

* 处理动画函数

```swift
///  自定义转场动画
func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    if isPresenting {
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        transitionContext.containerView().addSubview(toView)
    } else {
        let toView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        toView.removeFromSuperview()
    }

    transitionContext.completeTransition(true)
}
```

> 运行测试

* 添加动画代码

```swift
func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    if isPresented {
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        transitionContext.containerView().addSubview(toView)
        toView.transform = CGAffineTransformMakeScale(1.0, 0)
        toView.layer.anchorPoint = CGPointMake(0.5, 0)

        UIView.animateWithDuration(transitionDuration(transitionContext),
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 5.0,
            options: nil,
            animations: {
                toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }, completion: { (_) in
            toView.transform = CGAffineTransformIdentity
            transitionContext.completeTransition(true)
        })
    } else {
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        fromView.removeFromSuperview()
        transitionContext.completeTransition(true)
    }
}
```

