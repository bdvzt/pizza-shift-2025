//
//  PizzaAndDescribtion.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class PizzaAndDescribtion: UIViewController
{
    private let cardView = UIView()
    private let pizzaImage = UIView()
    private let textView = UIView()
    
    private let pizzaName = UILabel()
    private let descriptionLabel = UILabel()
    private let ingredients = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        setUpCardView()
        setUpImage()
        setUpTextView()
        setUpText()
    }
    
    private func setUpCardView(){
//        cardView.backgroundColor = .black
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 370)
        ])
    }
    
    private func setUpImage(){
//        pizzaImage.backgroundColor = .systemPink
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(pizzaImage)
        
        NSLayoutConstraint.activate([
            pizzaImage.topAnchor.constraint(equalTo: cardView.topAnchor),
            pizzaImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            pizzaImage.heightAnchor.constraint(equalToConstant: 220),
            pizzaImage.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setUpTextView(){
//        textView.backgroundColor = .darkGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
    
    private func setUpText(){
        pizzaName.text = "Название"
        pizzaName.font = UIFont.boldSystemFont(ofSize: 24)
        pizzaName.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "30 см, традиционное тесто"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ingredients.text = "Цыпленок, моцарелла"
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
}

#Preview{
    PizzaAndDescribtion()
}
