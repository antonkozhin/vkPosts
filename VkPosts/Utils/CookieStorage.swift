import UIKit

class CookieStorage {
    
    static let instance = CookieStorage()
    
    func clear() {
        let cookieJar = HTTPCookieStorage.shared
        for cookie in cookieJar.cookies! {
            print(cookie.name+"="+cookie.value)
            cookieJar.deleteCookie(cookie)
        }
    }
    
}
