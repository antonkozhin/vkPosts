import UIKit

protocol MainView: class {

}

protocol MainPresentation: class {
    
}

protocol MainInteractorOutput: class {

}

protocol MainProvider: class {
    
    func fetchPosts()

}

protocol MainWireframe: class {

}

protocol MainConfigurator: class {
    
    static func assembleModule() -> UIViewController

}
