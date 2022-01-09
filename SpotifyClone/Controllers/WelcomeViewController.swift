//
//  ViewController.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/6/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    
    let root = UIApplication.shared.windows.last?.rootViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
        let vc =  UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "authentication") as? AuthenticationViewController
        
        guard let sb = vc else {return}
        
        sb.modalPresentationStyle = .fullScreen
        
        sb.completionHandler = { [weak self] success in
            
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
            
        }
        
        navigationController?.pushViewController(sb, animated: true)
        
        
    }
    
    private func handleSignIn(success: Bool) {
        // Log in user or scream for error
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something went wrong signing in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        
        let vc =  UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }

}

