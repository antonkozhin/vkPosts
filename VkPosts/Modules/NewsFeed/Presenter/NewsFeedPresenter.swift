class NewsFeedPresenter {

    weak var view: NewsFeedView?
    var router: NewsFeedWireframe?
    var interactor: NewsFeedProvider?
    
    private var posts: [Post] = [] {
        didSet {
            view?.reloadData()
        }
    }
}

extension NewsFeedPresenter: NewsFeedPresentation {
    
    func viewDidLoad() {
        interactor?.fetchPosts()
    }
    
}

extension NewsFeedPresenter: NewsFeedInteractorOutput {
    func postsFetched(_ posts: [Post]) {
        
    }
    
    
}
