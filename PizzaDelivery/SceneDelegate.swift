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
        
        let catalogUseCase = GetCatalogUseCaseImpl(repository: CatalogRepositoryImpl(networkService: NetworkService(tokenStorage: UserDefaultsStorage())))
        let catalogViewModel = CatalogViewModel(getCatalogUseCase: catalogUseCase)
        
        let catalogViewController = CatalogViewController(viewModel: catalogViewModel)
        catalogViewController.title = "Пицца"
        
        let ordersViewController = OrdersViewController()
        ordersViewController.title = "Заказы"
        
        let cartViewController = CartViewController()
        cartViewController.title = "Корзина"
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Профиль"
        
        let catalogNavController = UINavigationController(rootViewController: catalogViewController)
        let ordersNavController = UINavigationController(rootViewController: ordersViewController)
        let cartNavController = UINavigationController(rootViewController: cartViewController)
        let profileNavController = UINavigationController(rootViewController: profileViewController)
        
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
            catalogNavController,
            ordersNavController,
            cartNavController,
            profileNavController
        ], animated: true)
        
        self.window?.rootViewController = tabBarViewController
        self.window?.makeKeyAndVisible()
    }
    
}

