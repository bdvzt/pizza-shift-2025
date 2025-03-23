//
//  IngredientComponent.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class IngredientComponent: UIView {
    private let ingredientView = UIView()
    private let ingredientImage = UIImageView()
    private let ingredientName = UILabel()
    private let ingredientPrice = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        setUpIngredientView()
        setUpIngredientImage()
        setUpIngredientName()
        setUpIngredientPrice()
    }
    
    private func setUpIngredientView() {
        addSubview(ingredientView)
        ingredientView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientView.topAnchor.constraint(equalTo: topAnchor),
            ingredientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ingredientView.heightAnchor.constraint(equalToConstant: 172),
            ingredientView.widthAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    private func setUpIngredientImage() {
        ingredientView.addSubview(ingredientImage)
        ingredientImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientImage.topAnchor.constraint(equalTo: ingredientView.topAnchor, constant: 8),
            ingredientImage.centerXAnchor.constraint(equalTo: ingredientView.centerXAnchor),
            ingredientImage.heightAnchor.constraint(equalToConstant: 88),
            ingredientImage.widthAnchor.constraint(equalToConstant: 88)
        ])
        
        ingredientView.backgroundColor = .white
        ingredientView.layer.cornerRadius = 20
        ingredientView.layer.shadowColor = UIColor.black.cgColor
        ingredientView.layer.shadowOpacity = 0.4
        ingredientView.layer.shadowOffset = CGSize(width: 0, height: 4)
        ingredientView.layer.shadowRadius = 10
    }
    
    private func setUpIngredientName() {
        ingredientName.text = "Название"
        ingredientName.font = UIFont.systemFont(ofSize: 14, weight: .light)
        ingredientName.textAlignment = .center
        ingredientName.numberOfLines = 0
        ingredientName.lineBreakMode = .byWordWrapping
        
        ingredientView.addSubview(ingredientName)
        ingredientName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientName.topAnchor.constraint(equalTo: ingredientImage.bottomAnchor, constant: 4),
            ingredientName.centerXAnchor.constraint(equalTo: ingredientView.centerXAnchor),
            ingredientName.leadingAnchor.constraint(greaterThanOrEqualTo: ingredientView.leadingAnchor, constant: 8),
            ingredientName.trailingAnchor.constraint(lessThanOrEqualTo: ingredientView.trailingAnchor, constant: -8)
        ])
    }
    
    private func setUpIngredientPrice() {
        ingredientPrice.text = "100 ₽"
        ingredientPrice.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        ingredientPrice.textAlignment = .center
        
        ingredientView.addSubview(ingredientPrice)
        ingredientPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientPrice.bottomAnchor.constraint(equalTo: ingredientView.bottomAnchor, constant: -4),
            ingredientPrice.centerXAnchor.constraint(equalTo: ingredientView.centerXAnchor)
        ])
    }
    
    func configure(with ingredient: PizzaIngredient) {
        let ingredientText = translateIngredient(ingredient: ingredient.name.rawValue)
        ingredientName.text = ingredientText.prefix(1).uppercased() + ingredientText.dropFirst()
        ingredientPrice.text = "\(ingredient.cost) ₽"
        
        if let url = URL(string: ingredient.imageIngredientUrl) {
            ingredientImage.kf.setImage(with: url)
        }
    }
}
