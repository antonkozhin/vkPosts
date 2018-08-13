import UIKit

class CookieStorage {
    
    static let instance = CookieStorage()
    
    func clear() {
        let cookieJar = HTTPCookieStorage.shared
        for cookie in cookieJar.cookies! {
            cookieJar.deleteCookie(cookie)
        }
    }
    
}
