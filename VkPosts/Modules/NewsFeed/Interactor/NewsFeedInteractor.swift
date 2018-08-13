import RxSwift

class NewsFeedInteractor {
    
    weak var output: NewsFeedInteractorOutput?
    
    fileprivate let disposeBag = DisposeBag()
    
    func providePosts() {
        output?.postsFetched([])
    }
    
}

extension NewsFeedInteractor: NewsFeedProvider {
    
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
