import UIKit

class UserInfoProvider {
    
    static let instance = UserInfoProvider()
    
    private static let accessTokenKey = "accessTokenKey"
    
    private init() {
        
    }
    
    func setAccessToken(_ accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: UserInfoProvider.accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: UserInfoProvider.accessTokenKey)
    }
    
}
