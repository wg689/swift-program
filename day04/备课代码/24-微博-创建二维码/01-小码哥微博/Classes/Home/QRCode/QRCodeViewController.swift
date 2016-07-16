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
    
    @IBOutlet weak var containerView: UIView!
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
        do{
            // 模拟器没有摄像头
            return try AVCaptureDeviceInput(device: device)
        }catch{
            print(error)
            return nil
        }
        
    }()
    // 3.获取输出对象
    private lazy var output : AVCaptureMetadataOutput = {
        let out = AVCaptureMetadataOutput()
        // 设置感兴趣的区域(设置比例, 且右上角是原点)
        let cropRect = self.containerView.frame
        let size = self.view.bounds.size
        
//        out.rectOfInterest = CGRect(x: cropRect.origin.x / size.width , y: cropRect.origin.y / size.height , width: cropRect.size.width/size.width, height: cropRect.size.height/size.height)
        
        // 应该旋转90度, x变y, y变x, 宽变高, 高变宽
        out.rectOfInterest = CGRect(x: cropRect.origin.y / size.height , y: cropRect.origin.x / size.width , width: cropRect.size.height/size.height, height: cropRect.size.width/size.width)
        
        return out
    }()
    
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
    // 5.创建边框图层
    private lazy var drawLayer: CALayer = {
        let layer = CALayer()
        layer.frame = self.view.frame
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
//        print(metadataObjects.last?.stringValue)
        // 0.移除边线
        clearDrawLayer()
        
        // 1.绘制路径
        for object in metadataObjects
        {
            if object is AVMetadataMachineReadableCodeObject
            {
//                print(object)
                // 转换元数据对象坐标
                guard let codeObject = previewLayer.transformedMetadataObjectForMetadataObject(object as! AVMetadataObject) as? AVMetadataMachineReadableCodeObject else {
                    continue
                }
//                print(codeObject)
                drawCorners(codeObject)
            }
        }
    }
    
    
    private func drawCorners(codeObject: AVMetadataMachineReadableCodeObject)
    {
        /*
        let layer = CAShapeLayer()
        layer.lineWidth = 4
        layer.lineJoin = "round"
        layer.strokeColor = UIColor.redColor().CGColor
        layer.path = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 200, height: 200)).CGPath
        drawLayer.addSublayer(layer)
        */
        
        // 1.判断数组是否为空
        if codeObject.corners.isEmpty
        {
            return
        }
        
        // 2.创建图层
        let layer = CAShapeLayer()
        layer.lineWidth = 4
        layer.strokeColor = UIColor.greenColor().CGColor
        layer.fillColor = UIColor.clearColor().CGColor
        
        // 3.绘制图形
        layer.path = cornersPath(codeObject.corners)
        
        // 4.添加图层
        drawLayer.addSublayer(layer)
    }
    /**
     根据坐标数组生成路径
     
     :param: corners 坐标数组
     
     :returns: 路径
     */
    private func cornersPath(corners: NSArray) -> CGPath
    {
        // 3.1创建路径
        let path = UIBezierPath()
        var point = CGPointZero
        // 3.2移动到第一个点
        var index = 0
        
        //        for i in 0..<codeObject.corners.count {
        //            print(codeObject.corners[i])
        //        }
        
        // 取出第0个点
        CGPointMakeWithDictionaryRepresentation((corners[index] as! CFDictionaryRef), &point)
        path.moveToPoint(point)
        // 3.3设置其它点
        while index < corners.count
        {
            CGPointMakeWithDictionaryRepresentation((corners[index++] as! CFDictionaryRef), &point)
            path.addLineToPoint(point)
        }
        // 3.4关闭路径
        path.closePath()
        return path.CGPath
    }
    
    private func clearDrawLayer(){
        // 1.判断是否有边线
        if drawLayer.sublayers?.count == 0 || drawLayer.sublayers == nil
        {
            return
        }
        // 2.移除所有边线
        for layer in drawLayer.sublayers!
        {
            layer.removeFromSuperlayer()
        }
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
