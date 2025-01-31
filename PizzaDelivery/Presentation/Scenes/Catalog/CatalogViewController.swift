//
//  CatalogViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import UIKit

class CatalogViewController: UIViewController {
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
        view.backgroundColor = .lightGray
    }
}

#Preview {
    CatalogViewController()
}
