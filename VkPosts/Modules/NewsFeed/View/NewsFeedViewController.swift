import UIKit

class NewsFeedViewController: UITableViewController {

    var presenter: NewsFeedPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsFeedRouter.assembleModule(view: self)
        presenter?.viewDidLoad()
    }
}

extension NewsFeedViewController: NewsFeedView {
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
