import UIKit

protocol AuthView: class {
    
    var presenter: AuthPresentation? { get set }
    
    func authSuccess()
    func authFail()
    
}

protocol AuthPresentation: class {
    
    var view: AuthView? { get set }
    
    func urlLoaded(url: String)
    
}

