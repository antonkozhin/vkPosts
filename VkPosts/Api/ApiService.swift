import Moya

enum ApiService {
    case getNewsFeed(filters: String, count: Int, startFrom: String?)
}

extension ApiService: TargetType {

    var baseURL: URL { return URL(string: "https://api.vk.com/method/")! }
    
    var path: String {
        switch self {
        case .getNewsFeed:
            return "newsfeed.get"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getNewsFeed(let filters, let count, let startFrom):
            var urlParameters = [String: Any]()
            urlParameters["access_token"] = UserInfoProvider.instance.getAccessToken()
            urlParameters["v"] = Constants.vkApiVersion
            urlParameters["filters"] = filters
            urlParameters["count"] = count
            urlParameters["start_from"] = startFrom
            return .requestCompositeData(bodyData: Data(), urlParameters: urlParameters)
        default:
            return .requestPlain
        }
    }
        
    var headers: [String: String]? {
        return nil
    }
    
}


