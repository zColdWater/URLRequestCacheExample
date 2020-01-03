import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var requestURL: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var urlsession: URLSession?
    var url: URL?
    
    // default
    var type: TableViewRowType
    
    init(type: TableViewRowType) {
        self.type = type
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSession()
        downloadImage()
    }
    
    func setupSession() {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        switch self.type {
        case .useProtocolCachePolicyCacheControlExample:
            configuration.requestCachePolicy = .useProtocolCachePolicy
            url = URL(string: "http://127.0.0.1:2001/http_max_age_beauty.png")!
            break
        case .useProtocolCachePolicyEtagExample:
            configuration.requestCachePolicy = .useProtocolCachePolicy
            url = URL(string: "http://127.0.0.1:2001/http_etag_beauty.png")!
            break
        case .useProtocolCachePolicyLastModifiedExample:
            configuration.requestCachePolicy = .useProtocolCachePolicy
            url = URL(string: "http://127.0.0.1:2001/http_last_modify_beauty.png")!
            break
        case .useProtocolCachePolicyExample:
            configuration.requestCachePolicy = .useProtocolCachePolicy
            url = URL(string: "http://127.0.0.1:2001/http_normal_beauty.png")!
            break
        case .reloadIgnoringLocalCacheDataExample:
            configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            url = URL(string: "")!
            break
        case .returnCacheDataElseLoadExample:
            configuration.requestCachePolicy = .returnCacheDataElseLoad
            url = URL(string: "")!
            break
        case .returnCacheDataDontLoadExample:
            configuration.requestCachePolicy = .returnCacheDataDontLoad
            url = URL(string: "")!
            break
        }
        self.urlsession =  URLSession(configuration: configuration)
    }
    
    func downloadImage() {
        urlsession!.dataTask(with: self.url!) { (data, resp, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.requestURL.text = self.url!.absoluteString
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }.resume()
    }
    
}
