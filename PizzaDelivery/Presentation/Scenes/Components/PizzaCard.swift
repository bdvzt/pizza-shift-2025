//
//  PizzaCard.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import UIKit
import Kingfisher

class PizzaCard: UITableViewCell {
    private let cardView = UIView()
    private let pizzaImage = UIImageView()
    private let textView = UIView()
    
    private let pizzaName = UILabel()
    private let descriptionLabel = UILabel()
    private let price = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        selectionStyle = .none
        backgroundColor = .clear
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
        cardView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setUpPizzaImage() {
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
        pizzaName.font = UIFont.boldSystemFont(ofSize: 18)
        pizzaName.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        price.font = UIFont.boldSystemFont(ofSize: 16)
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
            
            price.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            price.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            price.bottomAnchor.constraint(equalTo: textView.bottomAnchor)
        ])
    }
    
    func configure(with pizza: Pizza) {
        pizzaName.text = pizza.name
        descriptionLabel.text = pizza.description
        price.text = "\(pizza.sizes.first?.price ?? 0) ₽"
        
        guard let url = URL(string: pizza.imageUrl) else { return }
        
        if let url = URL(string: pizza.imageUrl) {
            pizzaImage.kf.setImage(with: url)
        }
    }
}

#Preview {
    PizzaCard()
}
