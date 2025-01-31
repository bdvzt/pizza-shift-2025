//
//  CatalogViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import UIKit

class CatalogViewController: UIViewController {
    private let tableView = UITableView()
    private var viewModel: CatalogViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchData()
    }
    
    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(PizzaCard.self, forCellReuseIdentifier: "PizzaCard")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func fetchData() {
        Task {
            await viewModel.fetchPizzas()
        }
    }
}

extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCard", for: indexPath) as? PizzaCard else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.pizzas[indexPath.row])
        return cell
    }
}


//#Preview{
//    CatalogViewController(viewModel: viewModel)
//}
