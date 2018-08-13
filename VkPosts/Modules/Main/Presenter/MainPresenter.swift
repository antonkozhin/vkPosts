class MainPresenter {

    weak var view: MainView?
    var router: MainWireframe!
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
