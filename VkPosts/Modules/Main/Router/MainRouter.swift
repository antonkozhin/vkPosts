import UIKit

class MainRouter {

    weak var view: UIViewController?

}

extension MainRouter: MainWireframe {

}

extension MainRouter: MainConfigurator {
    
    static func assembleModule(view: MainViewController) {
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor()

        view.presenter =  presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        router.view = view

        interactor.output = presenter
    }

}
