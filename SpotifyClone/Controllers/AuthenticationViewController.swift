//
//  AuthenticationViewController.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/6/21.
//

import UIKit
import WebKit

class AuthenticationViewController: UIViewController, WKNavigationDelegate  {


    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        guard let url = AuthManager.shared.signInURL else {
            return
        }
        
        webView.load(URLRequest(url: url))
        
        
    }
    
    public var completionHandler:((Bool) -> Void)?
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {return}
        
        //Exchange the code for access token, get code from query components
        let component = URLComponents(string: url.absoluteString)
        
        // Get the code by going through the query items and and where the query item is 'code', get the value
        guard let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else {return}
        
        webView.isHidden = true
        
        print("Code: \(code)")
        
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(success)
            }
            
        }
        
    }

   

}
