import UIKit
import WebKit

class AuthViewController: UIViewController {
    
    var presenter: AuthPresentation?
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthPresenter()
        presenter?.view = self
        let myURL = URL(string: "https://oauth.vk.com/authorize?client_id=6658433&response_type=token&v=5.80")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}

extension AuthViewController: AuthView {
    
    func authSuccess() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func  authFail() {
        //TODO: Сделать отображение сообщения о неудаче
    }
}

extension AuthViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url else {
            authFail()
            return
        }
        presenter?.urlLoaded(url: url.absoluteString)
    }
    
}
