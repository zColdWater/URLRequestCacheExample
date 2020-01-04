import UIKit

let TableViewCellId: String = "URLRequestCache-Example"

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [TableViewSectionType: [TableViewRowType]] =
        [.useProtocolCachePolicy:[.useProtocolCachePolicyCacheControlExample,.useProtocolCachePolicyEtagExample,.useProtocolCachePolicyLastModifiedExample,.useProtocolCachePolicyExample],
         .reloadIgnoringLocalCacheData:[.reloadIgnoringLocalCacheDataExample],
         .returnCacheDataElseLoad:[.returnCacheDataElseLoadExample],
         .returnCacheDataDontLoad:[.returnCacheDataDontLoadExample]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "URLRequestCache-Example"
        setupTableView()
    }
    
    
    @IBAction func cleanCache(_ sender: Any) {
        setupCleanURLRequestCache()
        let cache = URLCache(memoryCapacity: 4 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024)
        URLCache.shared = cache
    }
    
    // 清空缓存
    func setupCleanURLRequestCache() {
        let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        let cachesDirectory = libraryDirectory + "/Caches" + "/\(Bundle.main.bundleIdentifier!)"
        let isExist = FileManager.default.fileExists(atPath: cachesDirectory)
        if isExist {
            try! FileManager.default.removeItem(atPath: cachesDirectory)
        }
        print(isExist)
        print("cachesDirectory:\(cachesDirectory)")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellId)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let type = TableViewSectionType(rawValue: section) else {
            assertionFailure()
            return ""
        }
        return type.getName()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TableViewSectionType.init(rawValue: section)
        return dataSource[section!]!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = TableViewSectionType.init(rawValue: indexPath.section)!
        dataSource[section]![indexPath.row].perform(controller: self.navigationController!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = TableViewSectionType(rawValue: indexPath.section) else { assertionFailure(); return UITableViewCell() }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: TableViewCellId)
        cell.textLabel?.text = dataSource[type]?[indexPath.row].getName()
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = dataSource[type]?[indexPath.row].getDescription()
        cell.detailTextLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        cell.detailTextLabel?.textColor = .red
        return cell
    }
    
}

