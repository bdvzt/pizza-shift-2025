//
//  IngredientRow.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 01.02.2025.
//

import UIKit

class IngredientRow: UITableViewCell {
    
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        stackView.alignment = .center 
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure(with ingredients: [PizzaIngredient]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for ingredient in ingredients {
            let ingredientComponent = IngredientComponent(frame: .zero)
            ingredientComponent.configure(with: ingredient)
            stackView.addArrangedSubview(ingredientComponent)
        }
        
        while stackView.arrangedSubviews.count < 3 {
            let spacer = UIView()
            spacer.backgroundColor = .clear
            stackView.addArrangedSubview(spacer)
        }
    }
}
