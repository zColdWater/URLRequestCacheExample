import Foundation
import UIKit

enum TableViewRowType: Int {
    
    case useProtocolCachePolicyCacheControlExample
    case useProtocolCachePolicyEtagExample
    case useProtocolCachePolicyLastModifiedExample
    case useProtocolCachePolicyExample
    case reloadIgnoringLocalCacheDataExample
    case returnCacheDataElseLoadExample
    case returnCacheDataDontLoadExample
    case webview1Example
    case webview2Example

    func getName() -> String {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            return "UseProtocolCachePolicyCacheControl-CacheControl"
        case .useProtocolCachePolicyEtagExample:
            return "UseProtocolCachePolicyCacheControl-ETag"
        case .useProtocolCachePolicyLastModifiedExample:
            return "UseProtocolCachePolicyCacheControl-LastModified"
        case .useProtocolCachePolicyExample:
            return "UseProtocolCachePolicyCacheControl-Normal"
        case .reloadIgnoringLocalCacheDataExample:
            return "ReloadIgnoringLocalCacheData"
        case .returnCacheDataElseLoadExample:
            return "ReturnCacheDataElseLoad"
        case .returnCacheDataDontLoadExample:
            return "ReturnCacheDataDontLoad"
        case .webview1Example:
            return "自己写的简单H5"
        case .webview2Example:
            return "百度"
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            return "响应头只返回 Cache-Control: max-age=12 (12秒之内，不会再向服务器发起真实网络请求，只使用本地缓存。)"
        case .useProtocolCachePolicyEtagExample:
            return "响应头只返回 ETag (下发到客户端后，客户端再次发起请求，请求头都会带上 if-none-match 值，服务器用这个值和自己的Etag的对比，如果一直就返回304，让客户端使用缓存，如果不一致，给客户端返回200，让客户端拿服务器下发数据。 )"
        case .useProtocolCachePolicyLastModifiedExample:
            return "响应头只返回 LastModified (如果响应头只是单独设置这个配置，iOS端，请求到结果后，将结果缓存，下次不会再发起网络请求，类似max-age，不建议服务器单独只设置这个配置，因为这样的话，即使服务端换了资源，客户端也再也无法察觉，只有清除URLRequest的缓存才可以再次更新到。)"
        case .useProtocolCachePolicyExample:
            return "响应头默认返回 包含 Cache-Control: max-age=0，ETag，LastModified（max-age=0，意味着每次都需要发起真是的网络请求到服务器，ETag和LastModified下发到客户端后，客户端端会在下次请求的时候在请求头里面带上，分别是 if-none-match,if-modified-since,服务器用客户端的值来和自己对比，然后决定是304用缓存，还是200使用服务器下发的实时资源。）"
        case .reloadIgnoringLocalCacheDataExample:
            return "忽略本地缓存 每次都从网络中获取新的数据"
        case .returnCacheDataElseLoadExample:
            return "只要本地有缓存 就一直用这份缓存 不会更新，如果没缓存去网络中获取"
        case .returnCacheDataDontLoadExample:
            return "如果本地有缓存就使用缓存 本地没有缓存就请求失败 类似离线模式"
        case .webview1Example:
            return "通过验证，我们发现，标签资源的加载使用的是我们设置的 reloadIgnoringLocalCacheData 缓存策略，但是由 HTML 里面的XHR发起的网络请求的缓存策略是 默认的缓存策略，也就是 useProtocolCachePolicy！"
        case .webview2Example:
            return "通过验证，我们发现，标签资源的加载使用的是我们设置的 reloadIgnoringLocalCacheData 缓存策略，但是由 HTML 里面的XHR发起的网络请求的缓存策略是 默认的缓存策略，也就是 useProtocolCachePolicy！"
        }
    }
    
    
    
    func perform(controller: UINavigationController) {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyCacheControlExample)
            vc.title = "CacheControl"
            controller.pushViewController(vc, animated: true)
            break
        case .useProtocolCachePolicyEtagExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyEtagExample)
            vc.title = "ETag"
            controller.pushViewController(vc, animated: true)
            break
        case .useProtocolCachePolicyLastModifiedExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyLastModifiedExample)
            vc.title = "LastModified"
            controller.pushViewController(vc, animated: true)
            break
        case .useProtocolCachePolicyExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyExample)
            vc.title = "Normal"
            controller.pushViewController(vc, animated: true)
            break
        case .reloadIgnoringLocalCacheDataExample:
            let vc = DetailViewController.init(type: .reloadIgnoringLocalCacheDataExample)
            vc.title = "ReloadIgnoringLocalCacheDataExample"
            controller.pushViewController(vc, animated: true)
            break
        case .returnCacheDataElseLoadExample:
            let vc = DetailViewController.init(type: .returnCacheDataElseLoadExample)
            vc.title = "ReturnCacheDataElseLoadExample"
            controller.pushViewController(vc, animated: true)
            break
        case .returnCacheDataDontLoadExample:
            let vc = DetailViewController.init(type: .returnCacheDataDontLoadExample)
            vc.title = "ReturnCacheDataDontLoadExample"
            controller.pushViewController(vc, animated: true)
            break
        case .webview1Example:
            let vc = WebViewViewController(url: URL(string: "http://127.0.0.1:2001/app.html")!)
            controller.pushViewController(vc, animated: true)
            break
        case .webview2Example:
            let vc = WebViewViewController(url: URL(string: "https://www.baidu.com/")!)
            controller.pushViewController(vc, animated: true)
            break
        }
    }
}

