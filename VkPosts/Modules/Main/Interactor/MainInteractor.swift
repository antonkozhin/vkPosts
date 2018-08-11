import RxSwift

class MainInteractor {

    weak var output: MainInteractorOutput?
    
    fileprivate let disposeBag = DisposeBag()
    
    func providePosts() {

    }
    
}

extension MainInteractor: MainProvider {
    
    func fetchPosts() {
        Network.instance.provider.rx.request(.getNewsFeed(filters: "post", count: 1, startFrom: nil))
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .mapObject(RestNewsFeed.self)
            .subscribe { [weak self] event -> Void in
                switch event {
                case .success(let restNewsFeed):
                    self?.providePosts()
                case .error:
                    self?.providePosts()
                }
            }.disposed(by: disposeBag)
    }

}
