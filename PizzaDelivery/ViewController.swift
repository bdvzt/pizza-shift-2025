//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let catalogService = GetCatalogService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Get pizzas", for: .normal)
        button.addTarget(self, action: #selector(fetchPizzasButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc
    private func fetchPizzasButtonTapped() {
        Task {
            await getPizzas()
        }
    }
    
    @objc private func getPizzas() async {
        do {
            let pizzasResponse = try await catalogService.getCatalog()
            print(pizzasResponse.catalog)
        } catch {
            print("Error getting pizzas: \(error)")
        }
    }
    
}

#Preview() {
    ViewController()
}
