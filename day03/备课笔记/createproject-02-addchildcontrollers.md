# 添加子控制器

## 功能需求

* 由于采用了多视图控制器的设计方式，因此需要通过代码的方式向主控制器中添加子控制器

## 文件准备

* 将素材文件夹中的 `TabBar` 拖拽到 `Images.xcassets` 目录下

## 代码实现

### 添加第一个视图控制器

```swift
    /**
     初始化子控制器

     :param: childController 需要初始化的子控制器
     :param: title           初始化的标题
     :param: imageName       初始化的图片
     */
    func addChildViewController(childController: UIViewController, title:String, imageName:String) {

        // 1.从内像外设置, nav和tabbar都有
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")

        // 注意: Xocde7之前只有文字有效果, 还需要设置图片渲染模式
        tabBar.tintColor = UIColor.orangeColor()

        // 2.创建导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(childController)

        // 3.添加控制器到tabbarVC
        addChildViewController(nav)
    }
```

* 设置UITabbar的tintColor

```swift
 tabBar.tintColor = UIColor.orangeColor()
```

* Xocde7之前只有文字有效果, 还需要设置图片渲染模式
    * 方式一
![](./images/CreateProject/修改图片渲染模式.png)
    * 方式二
        * UIImageRenderingModeAutomatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
        * UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
        * UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。

```swift
    let image = UIImage(named: imageName)
    image?.imageWithRenderingMode(.AlwaysOriginal)
```

* 扩充调用函数，添加其他控制器

```swift
    /**
     添加所有子控制
     */
    func addChildViewControllers() {
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
```
