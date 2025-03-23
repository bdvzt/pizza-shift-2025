//
//  PizzaAndDescription.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit
import Kingfisher

class PizzaAndDescription: UIView {
    
    private let cardView = UIView()
    private let pizzaImage = UIImageView()
    private let textView = UIView()
    
    private let pizzaName = UILabel()
    private let descriptionLabel = UILabel()
    private let ingredients = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        setUpCardView()
        setUpImage()
        setUpTextView()
        setUpText()
    }
    
    private func setUpCardView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setUpImage() {
        pizzaImage.contentMode = .scaleAspectFit
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(pizzaImage)
        
        NSLayoutConstraint.activate([
            pizzaImage.topAnchor.constraint(equalTo: cardView.topAnchor),
            pizzaImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            pizzaImage.heightAnchor.constraint(equalToConstant: 220),
            pizzaImage.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setUpTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
    
    private func setUpText() {
        pizzaName.font = UIFont.boldSystemFont(ofSize: 24)
        pizzaName.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ingredients.font = UIFont.systemFont(ofSize: 16)
        ingredients.numberOfLines = 0
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        
        textView.addSubview(pizzaName)
        textView.addSubview(descriptionLabel)
        textView.addSubview(ingredients)
        
        NSLayoutConstraint.activate([
            pizzaName.topAnchor.constraint(equalTo: textView.topAnchor),
            pizzaName.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            pizzaName.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: pizzaName.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            ingredients.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            ingredients.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            ingredients.trailingAnchor.constraint(equalTo: textView.trailingAnchor)
        ])
    }
    
    func configure(with pizza: Pizza) {
        pizzaName.text = pizza.name
        descriptionLabel.text = pizza.description
        var localizedIngredients = pizza.ingredients.map { translateIngredient(ingredient: $0.name.rawValue) }
        
        if let first = localizedIngredients.first {
            localizedIngredients[0] = first.prefix(1).uppercased() + first.dropFirst()
        }
        
        ingredients.text = localizedIngredients.joined(separator: ", ")
        
        if let url = URL(string: pizza.imageUrl) {
            pizzaImage.kf.setImage(with: url)
        }
    }
}
