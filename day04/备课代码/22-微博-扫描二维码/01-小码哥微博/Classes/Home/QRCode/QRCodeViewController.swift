//
//  QRCodeViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {
    // 底部视图
    @IBOutlet weak var customTabBar: UITabBar!
    // 容器视图高度
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    // 容器视图宽度
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    // 冲击波顶部约束
    @IBOutlet weak var scanlineCons: NSLayoutConstraint!
    /// 冲击波视图
    @IBOutlet weak var scanlineView: UIImageView!
    
    
    // MAKR: - 内部控制方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置默认选中第1项
        customTabBar.selectedItem = customTabBar.items![0]
        // 2.设置监听
        customTabBar.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimation()
    }
    
    // MAKR: - 内部控制方法
    private func startAnimation(){
        
        // 1.重新设置冲击波顶部约束
        // 一定要加上这一句, 否则会混乱
        scanlineCons.constant = -containerHeight.constant
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(2.0) { () -> Void in
            // 0.设置动画重复次数
            UIView.setAnimationRepeatCount(MAXFLOAT)
            // 1.修改约束
            self.scanlineCons.constant = self.containerHeight.constant
            // 2.执行动画
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func closeItemClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - 懒加载
    // 1.创建桥梁
    private lazy var session: AVCaptureSession = AVCaptureSession()
    // 2.获取输入设备(摄像头)
    private lazy var inputDevice: AVCaptureDeviceInput? = {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
            // 模拟器没有摄像头
        return try? AVCaptureDeviceInput(device: device)
    }()
    // 3.获取输出对象
    private lazy var output = AVCaptureMetadataOutput()
    
    // 4.创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        // 1.创建预览图层
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        // 2.设置frame
        layer.frame = self.view.frame
        // 3.设置填充模式, 否则4s会有问题
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        return layer
    }()
}

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate
{
    private func setupScanQRCode(){
        // 关联输入输出对象
        // 1.判断能否添加输入设备
        if !session.canAddInput(inputDevice)
        {
            return
        }
        // 2.判断能否添加输出对象
        if !session.canAddOutput(output)
        {
            return
        }
        // 3.添加输入输出对象
        session.addInput(inputDevice)
        print("添加前:\(output.availableMetadataObjectTypes)")
        session.addOutput(output)
        print("添加后:\(output.availableMetadataObjectTypes)")
        
        // 设置输出对象能够解析的类型必须在输出对象添加到会话之后设置, 否则会报错
        // 4.告诉输出对象, 需要输出什么样的数据(支持解析🐴类型数据)
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        // 5.设置代理监听输出对象输出的数据
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        // 6.添加预览图层
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        
        // 7.开始扫描
        session.startRunning()
    }
    
    // 监听扫描到得数据
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
    {
        print(metadataObjects.last?.stringValue)
    }
}

extension QRCodeViewController: UITabBarDelegate
{
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        // 1.修改高度
        print(item.tag)
        containerHeight.constant = item.tag == 0 ? 300 : 300 * 0.5
        
        // 2.停止动画
        self.scanlineView.layer.removeAllAnimations()
        
        // 3.重新开始动画
        startAnimation()
    }
}
