//
//  AppDelegate.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureBarButtonItem()
        return true
    }
    
    // MARK: UIBarButtonItem Configurations
    func configureBarButtonItem() {
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .focused)
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

