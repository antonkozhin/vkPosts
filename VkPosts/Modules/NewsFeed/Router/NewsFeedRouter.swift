import UIKit

class NewsFeedRouter {
    
    weak var view: UIViewController?

}

extension NewsFeedRouter: NewsFeedWireframe {
    
}

extension NewsFeedRouter: NewsFeedConfigurator {
    
    static func assembleModule(view: NewsFeedViewController) {
        let presenter = NewsFeedPresenter()
        let router = NewsFeedRouter()
        let interactor = NewsFeedInteractor()

        view.presenter =  presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        router.view = view

        interactor.output = presenter
    }

}
