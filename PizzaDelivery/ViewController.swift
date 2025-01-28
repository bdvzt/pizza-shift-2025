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
    private let paymentService = PaymentService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getPizzasButton = UIButton(type: .system)
        getPizzasButton.setTitle("Get pizzas", for: .normal)
        getPizzasButton.addTarget(self, action: #selector(fetchPizzasButtonTapped), for: .touchUpInside)
        getPizzasButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(getPizzasButton)
        
        let payButton = UIButton(type: .system)
        payButton.setTitle("Pay for pizzas", for: .normal)
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        payButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(payButton)
    }
    
    @objc
    private func fetchPizzasButtonTapped() {
        Task {
            await getPizzas()
        }
    }
    
    @objc
    private func payButtonTapped() {
        Task {
            await payForPizzas()
        }
    }
    
    @objc private func getPizzas() async {
        do {
            let pizzasResponse = try await catalogService.getCatalog()
            print(pizzasResponse.catalog)
        } catch {
            print(error)
        }
    }
    
    @objc private func payForPizzas() async {
        do {
            let paymentResponse = try await paymentService.pay()
            print(paymentResponse)
        } catch {
            print(error)
        }
    }
}

#Preview () {
    ViewController()
}
