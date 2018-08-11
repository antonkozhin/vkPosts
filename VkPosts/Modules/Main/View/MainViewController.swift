import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainViewController: MainView {
    
}
