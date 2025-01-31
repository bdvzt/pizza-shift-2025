//
//  IngredientComponent.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit

class IngredientComponent: UIViewController
{
    private let ingredientView = UIView()
    private let ingredientImage = UIView()
    
    private let ingredientName = UILabel()
    private let ingredientPrice = UILabel()
    
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
        setUpIngredientView()
        setUpIngredientImage()
        setUpIngredientName()
        setUpIngredientPrice()
    }
    
    private func setUpIngredientView(){
        ingredientView.backgroundColor = .white
        view.addSubview(ingredientView)
        ingredientView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            ingredientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ingredientView.heightAnchor.constraint(equalToConstant: 172),
            ingredientView.widthAnchor.constraint(equalToConstant: 104)
        ])
        
        ingredientView.layer.cornerRadius = 20
        
        ingredientView.layer.shadowColor = UIColor.black.cgColor
        ingredientView.layer.shadowOpacity = 0.4
        ingredientView.layer.shadowOffset = CGSize(width: 0, height: 4)
        ingredientView.layer.shadowRadius = 10
    }
    
    private func setUpIngredientImage(){
        ingredientImage.backgroundColor = .white
        ingredientView.addSubview(ingredientImage)
        ingredientImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientImage.topAnchor.constraint(equalTo: ingredientView.topAnchor, constant: 8),
            ingredientImage.centerXAnchor.constraint(equalTo: ingredientView.centerXAnchor),
            ingredientImage.heightAnchor.constraint(equalToConstant: 88),
            ingredientImage.widthAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    private func setUpIngredientName(){
        ingredientName.text = "Название"
        ingredientName.font = UIFont.systemFont(ofSize: 14, weight: .light)
        ingredientName.textAlignment = .center
        
        ingredientView.addSubview(ingredientName)
        ingredientName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientName.topAnchor.constraint(equalTo: ingredientImage.bottomAnchor, constant: 4),
            ingredientName.centerXAnchor.constraint(equalTo: ingredientView.centerXAnchor)
        ])
    }
    
    private func setUpIngredientPrice(){
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
}

#Preview{
    IngredientComponent()
}
