class MainPresenter {

    weak var view: MainView?
    var router: MainWireframe!
    var interactor: MainProvider!
}

extension MainPresenter: MainPresentation {
    
    func isLogged() -> Bool {
        return UserInfoProvider.instance.getAccessToken() != nil
    }
    
    func logout() {
        UserInfoProvider.instance.deleteAccessToken()
        CookieStorage.instance.clear()
        view?.reloadViews(isLogged: isLogged())
    }

}

extension MainPresenter: MainInteractorOutput {

}
