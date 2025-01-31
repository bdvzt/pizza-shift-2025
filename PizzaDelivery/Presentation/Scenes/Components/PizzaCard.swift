//
//  PizzaCard.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import UIKit

class PizzaCard: UIViewController
{
    private let cardView = UIView()
    private let pizzaImage = UIView()
    private let textView = UIView()
    
    private let pizzaName = UILabel()
    private let descriptionLabel = UILabel()
    private let price = UILabel()
    
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
        setUpCardView()
        setUpPizzaImage()
        setUpTextView()
        setUpText()
    }
    
    private func setUpCardView() {
//        cardView.backgroundColor = .green
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setUpPizzaImage() {
//        pizzaImage.backgroundColor = .red
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(pizzaImage)
        
        NSLayoutConstraint.activate([
            pizzaImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            pizzaImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            pizzaImage.heightAnchor.constraint(equalToConstant: 120),
            pizzaImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setUpTextView() {
//        textView.backgroundColor = .blue
        textView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 16),
            textView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            textView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            textView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setUpText() {
        pizzaName.text = "Название"
        pizzaName.font = UIFont.boldSystemFont(ofSize: 18)
        pizzaName.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "Описание пиццы."
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        price.text = "300 рубЛЕЕЕЙ"
        price.font = UIFont.systemFont(ofSize: 16)
        price.translatesAutoresizingMaskIntoConstraints = false
        
        textView.addSubview(pizzaName)
        textView.addSubview(descriptionLabel)
        textView.addSubview(price)
        
        NSLayoutConstraint.activate([
            pizzaName.topAnchor.constraint(equalTo: textView.topAnchor),
            pizzaName.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            pizzaName.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: pizzaName.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            price.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            price.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            price.bottomAnchor.constraint(equalTo: textView.bottomAnchor)
        ])
    }
}

#Preview {
    PizzaCard()
}
