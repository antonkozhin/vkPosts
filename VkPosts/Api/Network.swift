import Moya

class Network {
    
    static let instance = Network()
    
    var provider: MoyaProvider<ApiService>
    
    init () {
        var plugins = [PluginType]()
        let loggerPlugin = NetworkLoggerPlugin()
        plugins.append(loggerPlugin)
        let authPlugin = AccessTokenPlugin(tokenClosure: {
            return UserInfoProvider.instance.getAccessToken() ?? ""
        }())
        plugins.append(authPlugin)
        provider = MoyaProvider<ApiService>(plugins: plugins)
    }
    
}
