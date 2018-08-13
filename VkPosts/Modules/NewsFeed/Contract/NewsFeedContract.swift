protocol NewsFeedView: class {
    
    func reloadData()
    
}

protocol NewsFeedPresentation: class {
    
    func viewDidLoad()
    
}

protocol NewsFeedInteractorOutput: class {
    
    func postsFetched(_ posts: [Post])
    
}

protocol NewsFeedProvider: class {
    
    func fetchPosts()
    
}

protocol NewsFeedWireframe: class {
    
}

protocol NewsFeedConfigurator: class {
    
    static func assembleModule(view: NewsFeedViewController)
    
}
