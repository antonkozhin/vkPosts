class MainPresenter {

    weak var view: MainView?
    var router: MainWireframe!
    var interactor: MainProvider!
}

extension MainPresenter: MainPresentation {

}

extension MainPresenter: MainInteractorOutput {

}
