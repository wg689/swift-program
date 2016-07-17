# AFNetworking

* 建立 `NetworkTools` 单例

```swift
import AFNetworking

class NetworkTools: AFHTTPSessionManager {

    private static let instance: NetworkTools = {
        let baseURL = NSURL(string: "https://api.weibo.com/")!
        let tools = NetworkTools(baseURL: baseURL)

        // 设置反序列化数据格式集合
        tools.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as! Set<String>

        return tools
    }()

    class func sharedNetworkTools() -> NetworkTools {
        return instance
    }
}
```

