import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var postsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var presenter: MainPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainRouter.assembleModule(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadViews(isLogged: presenter.isLogged())
    }

    @IBAction func logoutButtonClick(_ sender: Any) {
        presenter.logout()
    }
    
}

extension MainViewController: MainView {
    
    func reloadViews(isLogged: Bool) {
        loginButton.isHidden = isLogged
        postsButton.isHidden = !isLogged
        logoutButton.isHidden = !isLogged
    }
    
}
