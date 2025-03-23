//
//  CartViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class CartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
//        view.backgroundColor = .purple
    }
}

#Preview {
    CartViewController()
}


