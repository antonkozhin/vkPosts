import UIKit

protocol MainView: class {
    
    func reloadViews(isLogged: Bool)
    
}

protocol MainPresentation: class {
    
    func isLogged() -> Bool
    func logout()
    
}

protocol MainWireframe: class {

}

protocol MainConfigurator: class {
    
    static func assembleModule(view: MainViewController)

}
