//
//  SizeComponent.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class SizeComponent: UIView {
    
    private let stackView = UIStackView()
    
    private let smallSizeButton = UIButton()
    private let mediumSizeButton = UIButton()
    private let largeSizeButton = UIButton()
    
    private var selectedButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.backgroundColor = UIColor(named: "PizzaSizeGray")
        self.layer.cornerRadius = 20
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2)
        ])
        
        setUpButtons()
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
        button.setTitleColor(UIColor(named: "NotChosenSize"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "PizzaSizeGray")
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectButton(sender)
    }
    
    private func selectButton(_ button: UIButton) {
        selectedButton?.backgroundColor = UIColor(named: "PizzaSizeGray")
        selectedButton?.setTitleColor(UIColor(named: "NotChosenSize"), for: .normal)
        
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        selectedButton = button
    }
}
