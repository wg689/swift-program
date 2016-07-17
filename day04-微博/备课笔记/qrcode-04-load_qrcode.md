# 生成二维码

```swift
/// 生成二维码
private func generateQRCodeImage() -> UIImage {

    // 1. 生成二维码
    let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
    qrFilter.setDefaults()
    qrFilter.setValue("极客江南".dataUsingEncoding(NSUTF8StringEncoding), forKey: "inputMessage")
    let ciImage = qrFilter.outputImage

    // 2. 缩放处理
    let transform = CGAffineTransformMakeScale(10, 10)
    let transformImage = ciImage.imageByApplyingTransform(transform)

    // 3. 颜色滤镜
    let colorFilter = CIFilter(name: "CIFalseColor")!
    colorFilter.setDefaults()
    colorFilter.setValue(transformImage, forKey: "inputImage")
    // 前景色
    colorFilter.setValue(CIColor(color: UIColor.blackColor()), forKey: "inputColor0")
    // 背景色
    colorFilter.setValue(CIColor(color: UIColor.whiteColor()), forKey: "inputColor1")

    let outputImage = colorFilter.outputImage

    return insertAvatarImage(UIImage(CIImage: outputImage), avatar: UIImage(named: "avatar")!)
}
```

* 插入头像

```swift
func insertAvatarImage(qrimage: UIImage, avatar: UIImage) -> UIImage {

    UIGraphicsBeginImageContext(qrimage.size)

    let rect = CGRect(origin: CGPointZero, size: qrimage.size)
    qrimage.drawInRect(rect)

    let w = rect.width * 0.2
    let x = (rect.width - w) * 0.5
    let y = (rect.height - w) * 0.5
    avatar.drawInRect(CGRect(x: x, y: y, width: w, height: w))

    let image = UIGraphicsGetImageFromCurrentImageContext()

    UIGraphicsEndImageContext()

    return image
}
```

> 查阅滤镜 `print(CIFilter.filterNamesInCategory(kCICategoryBuiltIn))`
