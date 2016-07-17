//
//  CardViewController.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/23.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var customImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let transform = CGAffineTransformMakeScale(10, 10)
        let ciImage = filter.outputImage!.imageByApplyingTransform(transform)
        // 5.设置二维码
        customImageView.image = UIImage(CIImage: ciImage)
    }

}
