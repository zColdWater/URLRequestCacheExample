import Foundation


enum TableViewSectionType: Int {
    
    case useProtocolCachePolicy = 0
    case reloadIgnoringLocalCacheData
    case returnCacheDataElseLoad
    case returnCacheDataDontLoad
    case webview

    func getName() -> String {
        switch self {
        case .useProtocolCachePolicy:
            return "UseProtocolCachePolicy (默认)"
        case .reloadIgnoringLocalCacheData:
            return "ReloadIgnoringLocalCacheData"
        case .returnCacheDataElseLoad:
            return "ReturnCacheDataElseLoad"
        case .returnCacheDataDontLoad:
            return "ReturnCacheDataDontLoad"
        case .webview:
            return "WebView"
        }
    }
}
