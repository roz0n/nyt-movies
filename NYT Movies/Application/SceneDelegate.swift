//
//  SceneDelegate.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tb = UITabBarController()
        tb.viewControllers = [configureSearchVC(), configurePicksVC(), configureFavoritesVC()]
        tb.selectedIndex = 1
        
        configureTabBar()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tb
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}

extension SceneDelegate {
    
    func configureTabBar() {
        // TODO: Figure out why constants aren't working here
        UITabBar.appearance().tintColor = K.Colors.NYTBlack
        UITabBar.appearance().barTintColor = K.Colors.NYTWhite
    }
    
    func configurePicksVC() -> UINavigationController {
        let vc = CriticsListViewController()
        let icon = UIImage(systemName: "film.fill")
        let title = "Critics"
        
        vc.title = title
        vc.tabBarItem = UITabBarItem(title: title, image: icon, tag: 0)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func configureFavoritesVC() -> UINavigationController {
        let vc = FavoritesViewController()
        let icon = UIImage(systemName: "star.fill")
        let title = "Favorites"
        
        vc.title = title
        vc.tabBarItem = UITabBarItem(title: title, image: icon, tag: 2)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func configureSearchVC() -> UINavigationController {
        let vc = SearchViewController()
        let iconConfig = UIImage.SymbolConfiguration(weight: .bold)
        let icon = UIImage(systemName: "magnifyingglass", withConfiguration: iconConfig)
        let title = "Search"
        
        vc.title = title
        vc.tabBarItem = UITabBarItem(title: title, image: icon, tag: 1)
        
        return UINavigationController(rootViewController: vc)
    }
    
}

