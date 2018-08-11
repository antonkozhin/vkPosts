class AuthPresenter {
    
    weak var view: AuthView?
    
    fileprivate func getQueryParameters(url: String) -> [String: String] {
        guard let queryRange = url.range(of: "#") else {
            return [:]
        }
        let queryParameters = url[queryRange.upperBound...].components(separatedBy: "&")
        var parameters = [String: String]()
        queryParameters.forEach { pair in
            let kv = pair.components(separatedBy: "=")
            parameters.updateValue(kv[1], forKey: kv[0])
        }
        return parameters
    }
    
}

extension AuthPresenter: AuthPresentation {

    func urlLoaded(url: String) {
        let queryParameters = getQueryParameters(url: url)
        if let accessToken = queryParameters["access_token"] {
            UserInfoProvider.instance.setAccessToken(accessToken)
            view?.authSuccess()
        } else {
            view?.authFail()
        }
    }
    
}
