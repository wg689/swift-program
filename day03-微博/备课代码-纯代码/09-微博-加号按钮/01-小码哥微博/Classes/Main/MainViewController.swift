//
//  MainViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.添加所有子控制器
        addChildViewControllers()
        
//        NJLog(tabBar.items)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        NJLog(tabBar.items)
        // 2.添加加号按钮
        setupComposetButton()
    }
    
    /**
     添加所有子控制
     */
    func addChildViewControllers() {

        // 1.获取json文件路径
        let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)!
        
        // 2.加载json数据
        let jsonData = NSData(contentsOfFile: jsonPath)
        
        // 3.序列化json
        guard let dictArray = try? NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers) else
        {
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            addChildViewController("NullViewController", title: "", imageName: "")
            addChildViewController("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
            return
        }
        
        // 4.遍历字典时候需要明确指明数组中的数据类型
        for dict in dictArray  as! [[String:String]]
        {
            // 由于addChildVC方法参数不能为nil, 但是字典中取出来的值可能是nil, 所以需要加上!
            addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
        }
        
    }
    
    /**
     初始化子控制器
     
     :param: childController 需要初始化的子控制器
     :param: title           初始化的标题
     :param: imageName       初始化的图片
     */
      func addChildViewController(childControllerName: String, title:String, imageName:String) {
     
        // 0.动态获取命名空间
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String

        // 1.拼接命名空间并生成Class
        // 在Swift中, 如果想通过一个字符串创建一个类, 那么该类名必须包含命名空间名称
        guard let cls:AnyClass = NSClassFromString(namespace + "." + childControllerName) else {
            return
        }
        
        // 2.告诉编译器真实类型是UIViewController
        // 在Swift中如果向通过一个AnyClass来创建一个对象, 必须先明确这个类的类型
        // 通过 AnyObject.Type 这种方式所得到是一个类的类型
        let vcCls = cls as! UIViewController.Type
        
        // 3.实例化控制器
        let childController = vcCls.init()
        
        // 1.从内像外设置, nav和tabbar都有
        childController.title = title
        if imageName != "" {
            childController.tabBarItem.image = UIImage(named: imageName)
            childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        }
        
        // 注意: Xocde7之前只有文字有效果, 还需要设置图片渲染模式
        tabBar.tintColor = UIColor.orangeColor()
        
        // 2.创建导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        // 3.添加控制器到tabbarVC
        addChildViewController(nav)
        
    }

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
    
    /**
     监听加号按钮点击
     注意:  运行循环监听到事件后，向 VC 发送消息，动态执行 方法，因此不能设置为 private
     Swift所有的东西都是在编译时确定的, 如果想让Swift支持OC的动态派发那么必须在前面加上@objc
     
     public: Framework 是可以被任何人使用的，你可以将其设置为 public 级别
     internal: app 或 Framework 的内部结构使用 internal 级别
     private: 只能在当前源文件中使用的实体。使用 private 级别，可以隐藏某些功能的特地的实现细节
     */
   // 如果我们确定使用这些内容的动态特性的话，我们需要手动给它们加上 @objc 修饰
    @objc private func composeBtnClick(){
        NJLog("")
    }
    // MARK: - 懒加载
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
        
        button.sizeToFit()
        // 5.返回按钮
        return button
    }()

    
}
