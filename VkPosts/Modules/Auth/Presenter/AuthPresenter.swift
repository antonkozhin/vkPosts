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
    
    fileprivate func getStringParameter(parameters: [String: String], forKey key: String) -> String? {
        return parameters[key]
    }
    
    fileprivate func getIntParameter(parameters: [String: String], forKey key: String) -> Int? {
        guard let stringParameter = getStringParameter(parameters: parameters, forKey: key) else {
            return nil
        }
        return Int(stringParameter)
    }
    
}

extension AuthPresenter: AuthPresentation {

    func urlLoaded(url: String) {
        let queryParameters = getQueryParameters(url: url)
        if let accessToken = getStringParameter(parameters: queryParameters, forKey: "access_token"),
            let userId = getIntParameter(parameters: queryParameters, forKey: "user_id"),
            let expiresIn = getIntParameter(parameters: queryParameters, forKey: "expires_in") {
            UserInfoProvider.instance.setAccessToken(accessToken)
            UserInfoProvider.instance.setUserId(userId)
            UserInfoProvider.instance.setExpiresIn(expiresIn)
            view?.authSuccess()
        } else {
            view?.authFail()
        }
    }
    
}
