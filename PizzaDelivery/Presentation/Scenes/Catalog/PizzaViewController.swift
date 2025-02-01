//
//  PizzaViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 31.01.2025.
//

import UIKit
import Kingfisher

class PizzaViewController: UIViewController {
    private let pizza: Pizza
    private let pizzaAndDescription = PizzaAndDescription()
    private let sizeComponent = SizeComponent(frame: .zero)
    
    private let ingredientsTableView = UITableView()
    private var ingredientRows: [[PizzaIngredient]] = []
    
    private let addText = UILabel()
    private let addToCartButton = UIButton()
    
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    
    init(pizza: Pizza) {
        self.pizza = pizza
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureData()
        ingredientsTableView.rowHeight = UITableView.automaticDimension
        ingredientsTableView.estimatedRowHeight = 100
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.axis = .vertical
        contentView.spacing = 16
        contentView.alignment = .fill
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        contentView.addArrangedSubview(pizzaAndDescription)
        pizzaAndDescription.translatesAutoresizingMaskIntoConstraints = false
        pizzaAndDescription.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        contentView.addArrangedSubview(sizeComponent)
        sizeComponent.translatesAutoresizingMaskIntoConstraints = false
        sizeComponent.heightAnchor.constraint(equalToConstant: 60).isActive = true
        sizeComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        sizeComponent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        addText.text = "Добавить по вкусу"
        addText.textAlignment = .center
        addText.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        addText.textColor = .black
        contentView.addArrangedSubview(addText)
        
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
        ingredientsTableView.register(IngredientRow.self, forCellReuseIdentifier: "IngredientRow")
        ingredientsTableView.separatorStyle = .none
        contentView.addArrangedSubview(ingredientsTableView)
        NSLayoutConstraint.activate([
            ingredientsTableView.heightAnchor.constraint(equalToConstant: 300),
            ingredientsTableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), 
            ingredientsTableView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        addToCartButton.setTitle("Добавить в корзину", for: .normal)
        addToCartButton.backgroundColor = UIColor(named: "ButtonColor") ?? .systemGreen
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        addToCartButton.layer.cornerRadius = 16
        addToCartButton.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        contentView.addArrangedSubview(addToCartButton)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func configureData() {
        pizzaAndDescription.configure(with: pizza)
        
        ingredientRows = stride(from: 0, to: pizza.ingredients.count, by: 3).map { index in
            let end = min(index + 3, pizza.ingredients.count)
            return Array(pizza.ingredients[index..<end])
        }
        
        ingredientsTableView.reloadData()
    }
    
    @objc private func addToCartTapped() {
        print("Пицца в корзине")
    }
}

extension PizzaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientRow", for: indexPath) as? IngredientRow else {
            return UITableViewCell()
        }
        let rowIngredients = ingredientRows[indexPath.row]
        cell.configure(with: rowIngredients)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
