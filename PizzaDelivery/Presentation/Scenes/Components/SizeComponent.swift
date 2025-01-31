//
//  SizeComponent.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class SizeComponent: UIViewController
{
    private let sizeView = UIView()
    private let stackView = UIStackView()
    
    private let smallSizeButton = UIButton()
    private let mediumSizeButton = UIButton()
    private let largeSizeButton = UIButton()
    
    private var selectedButton: UIButton?
    
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
        setUpSizeView()
        setUpStackView()
        setUpButtons()
    }
    
    private func setUpSizeView() {
        sizeView.backgroundColor = UIColor(named: "PizzaSizeGray")
        sizeView.layer.cornerRadius = 20
        sizeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sizeView)
        
        NSLayoutConstraint.activate([
            sizeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            sizeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sizeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sizeView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        sizeView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: sizeView.topAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: sizeView.leadingAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: sizeView.trailingAnchor, constant: -2),
            stackView.bottomAnchor.constraint(equalTo: sizeView.bottomAnchor, constant: -2)
        ])
    }
    
    private func setUpButtons() {
        setUpButton(smallSizeButton, title: "Маленькая")
        setUpButton(mediumSizeButton, title: "Средняя")
        setUpButton(largeSizeButton, title: "Большая")
        
        stackView.addArrangedSubview(smallSizeButton)
        stackView.addArrangedSubview(mediumSizeButton)
        stackView.addArrangedSubview(largeSizeButton)
        
        selectButton(smallSizeButton)
    }
    
    private func setUpButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectButton(sender)
    }
    
    private func selectButton(_ button: UIButton) {
        selectedButton?.backgroundColor = UIColor(named: "PizzaSizeGray")
        button.backgroundColor = .white
        selectedButton = button
    }
}

#Preview {
    SizeComponent()
}
