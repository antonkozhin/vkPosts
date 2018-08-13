import UIKit

class UserInfoProvider {
    
    static let instance = UserInfoProvider()
    
    private static let accessTokenKey       = "accessTokenKey"
    private static let userIdKey            = "userIdKey"
    private static let expiresInKey         = "expiresInKey"
    
    private init() {}
    
    func setAccessToken(_ accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: UserInfoProvider.accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: UserInfoProvider.accessTokenKey)
    }
    
    func deleteAccessToken() {
        UserDefaults.standard.removeObject(forKey: UserInfoProvider.accessTokenKey)
    }
    
    func setUserId(_ userId: Int) {
        UserDefaults.standard.set(userId, forKey: UserInfoProvider.userIdKey)
    }
    
    func getUserId() -> Int? {
        return UserDefaults.standard.integer(forKey: UserInfoProvider.userIdKey)
    }
    
    func setExpiresIn(_ expiresIn: Int) {
        UserDefaults.standard.set(expiresIn, forKey: UserInfoProvider.expiresInKey)
    }
    
    func getExpiresIn() -> Int? {
        return UserDefaults.standard.integer(forKey: UserInfoProvider.expiresInKey)
    }
    
}
