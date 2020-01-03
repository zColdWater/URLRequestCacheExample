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

    func getName() -> String {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            return "CacheControl"
        case .useProtocolCachePolicyEtagExample:
            return "ETag"
        case .useProtocolCachePolicyLastModifiedExample:
            return "LastModified"
        case .useProtocolCachePolicyExample:
            return "Normal"
        case .reloadIgnoringLocalCacheDataExample:
            return "reloadIgnoringLocalCacheDataExample"
        case .returnCacheDataElseLoadExample:
            return "returnCacheDataElseLoadExample"
        case .returnCacheDataDontLoadExample:
            return "returnCacheDataDontLoadExample"
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            return "响应头只返回 Cache-Control: max-age=120"
        case .useProtocolCachePolicyEtagExample:
            return "响应头只返回 ETag"
        case .useProtocolCachePolicyLastModifiedExample:
            return "响应头只返回 LastModified"
        case .useProtocolCachePolicyExample:
            return "响应头正常返回 包含 Cache-Control: max-age=120，ETag，LastModified"
        case .reloadIgnoringLocalCacheDataExample:
            return "reloadIgnoringLocalCacheDataExample"
        case .returnCacheDataElseLoadExample:
            return "returnCacheDataElseLoadExample"
        case .returnCacheDataDontLoadExample:
            return "returnCacheDataDontLoadExample"
        }
    }
    
    func perform(controller: UINavigationController) {
        switch self {
        case .useProtocolCachePolicyCacheControlExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyCacheControlExample)
            vc.title = "CacheControl"
            controller.pushViewController(vc, animated: true)
        case .useProtocolCachePolicyEtagExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyEtagExample)
            vc.title = "ETag"
            controller.pushViewController(vc, animated: true)
        case .useProtocolCachePolicyLastModifiedExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyLastModifiedExample)
            vc.title = "LastModified"
            controller.pushViewController(vc, animated: true)
        case .useProtocolCachePolicyExample:
            let vc = DetailViewController.init(type: .useProtocolCachePolicyExample)
            vc.title = "Normal"
            controller.pushViewController(vc, animated: true)
        case .reloadIgnoringLocalCacheDataExample:
            let vc = DetailViewController.init(type: .reloadIgnoringLocalCacheDataExample)
            vc.title = "ReloadIgnoringLocalCacheData"
            controller.pushViewController(vc, animated: true)
        case .returnCacheDataElseLoadExample:
            let vc = DetailViewController.init(type: .returnCacheDataElseLoadExample)
            vc.title = "ReturnCacheDataElseLoad"
            controller.pushViewController(vc, animated: true)
        case .returnCacheDataDontLoadExample:
            let vc = DetailViewController.init(type: .returnCacheDataDontLoadExample)
            vc.title = "ReturnCacheDataDontLoad"
            controller.pushViewController(vc, animated: true)
        }
    }
}

