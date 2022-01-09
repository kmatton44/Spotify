//
//  AppDelegate.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window = window
        
        if AuthManager.shared.isSignedIn {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "main") as! HomePageViewController
            window.rootViewController = viewController
        } else {
            let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
            window.rootViewController = UINavigationController(rootViewController: viewController)
                
        }
       
        window.makeKeyAndVisible()*/
        
        AuthManager.shared.refreshIfNeeded { success in
            
            print(success)
            
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

