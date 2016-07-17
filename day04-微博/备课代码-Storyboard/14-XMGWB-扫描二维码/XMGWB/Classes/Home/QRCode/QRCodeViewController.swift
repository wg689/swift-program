//
//  QRCodeViewController.swift
//  Weibo
//
//  Created by xiaomage on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {

    
    /// 容器视图
    @IBOutlet weak var containerView: UIView!
    /// 自定义UITabBar
    @IBOutlet weak var customTabbar: UITabBar!
    /// 冲击波顶部约束
    @IBOutlet weak var scanLineTopCons: NSLayoutConstraint!
    /// 容器高度
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    /// 冲击波
    @IBOutlet weak var scanLineView: UIImageView!

    // MARK: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.设置默认选中
        customTabbar.selectedItem = customTabbar.items![0]
        customTabbar.delegate = self
        
        // 2.开始扫描
        startScan()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       startAnimation()
    }
    
    // MARK: - 内部控制方法
    /// 监听关闭按钮点击
    @IBAction func closeBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// 开始冲击波动画
    private func startAnimation()
    {
        
        // 1.初始化冲击波位置
        scanLineTopCons.constant = -containerHeightCons.constant
        view.layoutIfNeeded()
        
        // 2.执行动画
        UIView.animateWithDuration(1.0, animations: { () -> Void in
        
        // 告诉系统该动画需要重复
        UIView.setAnimationRepeatCount(MAXFLOAT)
        self.scanLineTopCons.constant = self.containerHeightCons.constant
        self.view.layoutIfNeeded()
        })
    }
    
    /// 开始扫描
    private func startScan()
    {
        // 1.判断输入是否可以添加到会话中
        if !session.canAddInput(deviceInput)
        {
            return
        }
        // 2.判断输出是否可以添加到会话中
        if !session.canAddOutput(output)
        {
            return
        }
        // 3.添加输入和输出
        session.addInput(deviceInput)
        session.addOutput(output)
        
        // 4.设置输出可以解析的数据类型
        // 注意点: 设置输出对象能够解析的数据类型, 必须在输出对象添加到会话之后设置
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        // 5.添加预览图层
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        
        // 6.添加描边图层
        previewLayer.addSublayer(drawLayer)
        
        // 5.开始扫描
        session.startRunning()
    }

    
    // MARK: - 懒加载
    /// 创建输入
    private lazy var deviceInput: AVCaptureDeviceInput? = {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do{
            let input = try AVCaptureDeviceInput(device: device)
            return input
        }catch
        {
            return nil
            
        }
    }()
    /// 创建输出
    private lazy var output: AVCaptureMetadataOutput = {
       let output = AVCaptureMetadataOutput()
        return output
    }()
    
    /// 创建会话
    private lazy var session: AVCaptureSession =  AVCaptureSession()
    
    /// 创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
       let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = self.view.bounds
        return layer
    }()
    
    /// 描边图层
    private lazy var drawLayer: CALayer = {
       let layer = CALayer()
        layer.frame = self.view.bounds
        return layer
    }()
}

// MAKR: - AVCaptureMetadataOutputObjectsDelegate
extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate
{
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
    {
        print(metadataObjects.last!.stringValue)
        
    }
}
// MAKR: - UITabBarDelegate
extension QRCodeViewController: UITabBarDelegate
{
    // 监听tabBar点击
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {

        // 1.调整容器高度
        containerHeightCons.constant = (item.tag == 0) ? 300 : 150
        view.layoutIfNeeded()
        
        // 2.先移除图层上所有的动画
        scanLineView.layer.removeAllAnimations()
        
        // 3.再重新开启动画
        startAnimation()
    }
}
