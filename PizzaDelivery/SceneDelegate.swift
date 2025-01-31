//
//  SceneDelegate.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let catalogViewController = CatalogViewController()
        let ordersViewController = OrdersViewController()
        let cartViewController = CartViewController()
        let profileViewController = ProfileViewController()
        
        let tabBarViewController = UITabBarController()
        
        catalogViewController.tabBarItem = UITabBarItem(
            title: "Пицца",
            image: UIImage(named: "Pizza"),
            tag: 1
        )
        
        ordersViewController.tabBarItem = UITabBarItem(
            title: "Заказы",
            image: UIImage(named: "Orders"),
            tag: 2
        )
        
        cartViewController.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(named: "Trash"),
            tag: 3
        )
        
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "User"),
            tag: 4
        )
        
        tabBarViewController.tabBar.barTintColor = .white
        tabBarViewController.tabBar.tintColor = UIColor(named: "TabBarSelected")
        tabBarViewController.tabBar.unselectedItemTintColor = UIColor(named: "TabBarNotSelected")
        
        tabBarViewController.setViewControllers([
            catalogViewController,
            ordersViewController,
            cartViewController,
            profileViewController
        ], animated: true)
        
        self.window?.rootViewController = tabBarViewController
        self.window?.makeKeyAndVisible()
    }
    
    
    //    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    //        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    //        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    //        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    //        guard let windowScene = (scene as? UIWindowScene) else { return }
    //        self.window = UIWindow(windowScene: windowScene)
    //
    //        //        let navController = UINavigationController()
    //        //        let viewController = ViewController(viewModel: ViewController())
    //        /*
    //         let tokenStorage = UserDefaultsStorage()
    //         let networkService = NetworkService(tokenStorage: tokenStorage)
    //         let catalogRepository = CatalogRepositoryImpl(networkService: networkService)
    //         let catalogUseCase = GetCatalogUseCaseImpl(repository: catalogRepository)
    //         let viewController = ViewController2(catalogUseCase: catalogUseCase)
    //         //        navController.pushViewController(viewController, animated: true)
    //
    //         self.window?.rootViewController = UIHostingController(rootView: SwiftUIView())
    //         self.window?.makeKeyAndVisible()
    //         */
    //        let navController = UINavigationController()
    //        //        let viewController = ViewController(viewModel: ViewController())
    //        let viewController = ViewController()
    //        navController.pushViewController(viewController, animated: true)
    //
    //        self.window?.rootViewController = navController
    //        self.window?.makeKeyAndVisible()
    //    }
    
}

