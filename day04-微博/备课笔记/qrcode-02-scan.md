# 扫描二维码

## 第三方框架

* `ZXing` Android使用多
* `ZBar` iOS使用多

* 提示：以上两个框架都是老牌二维码框架，不过都不支持 64 位
* 目前在 iOS 开发中普遍使用苹果的 `AVFoundation` 框架，但是不支持图片识别功能
* `AVFoundation` 只支持通过摄像头扫描识别

## 识别原理

![](./images/二维码/扫描原理.png)


## 代码实现

* 拍摄会话

```swift
/// 拍摄会话，是扫描的桥梁
lazy var session = AVCaptureSession()
```

* 摄像头输入设备

```swift
// 2. 输入设备
lazy var inputDevice: AVCaptureDeviceInput? = {

    let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    return try? AVCaptureDeviceInput(device: device)
}()
```

* 数据输出

```swift
/// 数据输出
lazy var dataOutput = AVCaptureMetadataOutput()
```

* 建立通道，设置会话

```swift
private func setupSession() {
    // 1. 判断是否能够添加设备
    if !session.canAddInput(inputDevice) {
        print("无法添加输入设备")
        return
    }

    // 2. 判断能否添加输出数据
    if !session.canAddOutput(outputData) {
        print("无法添加输出数据")
        return
    }

    // 3. 添加设备
    session.addInput(inputDevice)
    session.addOutput(outputData)
    print(outputData.availableMetadataObjectTypes)

    // 4. 设置扫描数据类型
    outputData.metadataObjectTypes = outputData.availableMetadataObjectTypes

    // 5. 设置输出代理
    outputData.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
}
```

> 注意，一定要把输出设备添加到会话后，才有可用数据类型

* 实现协议方法

```swift
// MARK: - AVCaptureMetadataOutputObjectsDelegate
func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {

    println(metadataObjects)
}
```

> 必须要启动会话，才能开始扫描

```swift
///  开始扫描
private func startScan() {
    session.startRunning()
}
```

* 添加预览视图

```swift
/// 预览图层
lazy var previewLayer = {
    [unowned self] () -> AVCaptureVideoPreviewLayer
    return AVCaptureVideoPreviewLayer(session: self.session)
}()
```

* 设置图层

```swift
/// 设置图层
func setupLayers() {
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
    previewLayer.frame = view.bounds
    view.layer.insertSublayer(previewLayer, atIndex: 0)
}
```
