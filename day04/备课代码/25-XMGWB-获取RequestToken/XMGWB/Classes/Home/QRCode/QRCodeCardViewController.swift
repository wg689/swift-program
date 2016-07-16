//
//  QRCodeCardViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class QRCodeCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置背景颜色
        view.backgroundColor = UIColor.whiteColor()
        // 2.初始化操作
        title = "我的名片"
        // 3.添加名片容器
        view.addSubview(iconView)
        // 4.布局名片容器
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: view, size: CGSize(width: 300, height: 300))
        iconView.backgroundColor = UIColor.redColor()
        // 5.设置二维码
        iconView.image = creatQRCodeImage()
    }
    /**
    生成二维码图片
    
    :returns: 二维码图片
    */
    private func creatQRCodeImage() -> UIImage{
        /*
        二维码注意点:
        1.二维码的容错性很强, 哪怕缺少一部分也可以显示, 但是不能缺少太多.
        2.二维码的有些地方是不能覆盖的, 三个点. 这三个点称之为二维码的定位点
        3.生成二维码的时候, 切记不要存放太多数据, 数据越多扫描起来就越慢
        */
        // 1.创建滤镜对象
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        // 2.还原滤镜初始化属性
        filter.setDefaults()
        // 3.给二维码滤镜设置数据
        filter.setValue("极客江南".dataUsingEncoding(NSUTF8StringEncoding), forKey: "inputMessage")
        // 4.获取滤镜生成的图片
        let ciImage = filter.outputImage!
        let bgImage = createNonInterpolatedUIImageFormCIImage(ciImage, size: 200.0)
        
        // 5.获取头像
        let icon = UIImage(named: "nange.jpg")
        
        // 6.设置图片
        return createNewImageWithBg(bgImage, iconImage: icon!)
    }
    
    /**
    生成二维码名片
    
    :param: bgImage   背景图片
    :param: iconImage 头像
    
    :returns: 生成好的图片
    */
    private func createNewImageWithBg(bgImage:UIImage, iconImage: UIImage) -> UIImage{
        // 1.开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        // 2.绘制背景
        bgImage.drawInRect(CGRect(origin: CGPointZero, size: bgImage.size))
        // 3.绘制图标
        let iconW:CGFloat = 50.0
        let iconH:CGFloat = 50.0
        let iconX = (bgImage.size.width - iconW) * 0.5
        let iconY = (bgImage.size.height - iconH) * 0.5
        iconImage.drawInRect(CGRect(x: iconX, y: iconY, width: iconW, height: iconH))
        // 4.取出绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // 5.关闭上下文
        UIGraphicsEndImageContext()
        // 6.返回生成好得图片
        return newImage
    }
    /**
    根据CIImage生成指定大小的高清UIImage
    
    :param: image 指定CIImage
    :param: size    指定大小
    :returns: 生成好的图片
    */
    private func createNonInterpolatedUIImageFormCIImage(image: CIImage, size: CGFloat) -> UIImage {
        
        let extent: CGRect = CGRectIntegral(image.extent)
        let scale: CGFloat = min(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent))
        
        // 1.创建bitmap;
        let width = CGRectGetWidth(extent) * scale
        let height = CGRectGetHeight(extent) * scale
        let cs: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let bitmapRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, cs, 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImageRef = context.createCGImage(image, fromRect: extent)
        
        CGContextSetInterpolationQuality(bitmapRef,  CGInterpolationQuality.None)
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);
        
        // 2.保存bitmap到图片
        let scaledImage: CGImageRef = CGBitmapContextCreateImage(bitmapRef)!
        
        return UIImage(CGImage: scaledImage)
    }
    // MARK: - 懒加载
    private lazy var iconView: UIImageView = UIImageView()
}
