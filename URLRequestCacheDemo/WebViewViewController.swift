import UIKit
import WebKit
import BestHttpInterceptor

class WebViewViewController: UIViewController, HttpInterceptDelegate {

    @IBOutlet weak var webView: WKWebView!
    var url: URL? = nil
    
    init(url: URL) {
        self.url = url
        super.init(nibName: "WebViewViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WebView"
        register()
        let request = URLRequest(url: self.url!, cachePolicy: .reloadIgnoringLocalCacheData)
        webView.load(request)
    }
    
    func register() {
        let condition = HttpIntercepCondition.init(schemeType: .all) { (request) -> Bool in
            let policy = request.cachePolicy.description()
            print("使用的URL缓存策略是：\(policy)")
            // 都不进行拦截
            return false
        }
        let interceptor = HttpInterceptor(condition: condition, interceptorDelegate: self)
        interceptor.register()
    }

}



extension URLRequest.CachePolicy {
    
    
    func description() -> String {
        switch self {
        case .reloadIgnoringLocalAndRemoteCacheData:
            return "reloadIgnoringLocalAndRemoteCacheData"
        case .reloadIgnoringLocalCacheData:
            return "reloadIgnoringLocalCacheData"
        case .reloadRevalidatingCacheData:
            return "reloadRevalidatingCacheData"
        case .returnCacheDataDontLoad:
            return "returnCacheDataDontLoad"
        case .returnCacheDataElseLoad:
            return "returnCacheDataElseLoad"
        case .useProtocolCachePolicy:
            return "useProtocolCachePolicy"
        case .reloadIgnoringCacheData:
            return "useProtocolCachePolicy"
        @unknown default:
            fatalError()
        }
    }
    
}
