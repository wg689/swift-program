//
//  QRCodeCreateViewController.swift
//  Weibo
//
//  Created by xiaomage on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class QRCodeCreateViewController: UIViewController {

    /// 图片容器
    @IBOutlet weak var customImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        // 2.还原滤镜默认属性
        filter?.setDefaults()
        // 3.设置数据
        filter?.setValue("http://www.520it.com".dataUsingEncoding(NSUTF8StringEncoding), forKey: "inputMessage")
        // 4.从滤镜中取出二维码
        guard let ciImage = filter?.outputImage else
        {
            return
        }
        let bgImage = createNonInterpolatedUIImageFormCIImage(ciImage, size: 500)
        let iconImage = UIImage(named: "nange.jpg")!
        customImageView.image = createImage(bgImage, iconImage: iconImage)
    }

    /**
    合成图片
    
    - parameter bgImage:   背景图片
    - parameter iconImage: 图标
    */
    private func createImage(bgImage: UIImage, iconImage: UIImage) -> UIImage
    {
        // 1.开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        // 2.绘制大图
        bgImage.drawInRect(CGRect(origin: CGPointZero, size: bgImage.size))
        // 3.绘制小图
        let width: CGFloat = 80
        let height = width
        let x = (bgImage.size.width - width) * 0.5
        let y = (bgImage.size.height - height) * 0.5
        iconImage.drawInRect(CGRect(x: x, y: y, width: width, height: height))
        // 4.取出图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // 5.关闭上下文
        UIGraphicsEndImageContext()
        // 6.返回结果
        return newImage
    }
    
    /**
    生成高清二维码
    
    - parameter image: 需要生成原始图片
    - parameter size:  生成的二维码的宽高
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
}
