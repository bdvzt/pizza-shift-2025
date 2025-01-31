//
//  CatalogViewModel.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import UIKit

class CatalogViewModel {
    private let getCatalogUseCase: GetCatalogUseCase
    private(set) var pizzas: [Pizza] = []
    var reloadTableView: (() -> Void)?
    
    init(getCatalogUseCase: GetCatalogUseCase) {
        self.getCatalogUseCase = getCatalogUseCase
    }
    
    func fetchPizzas() async {
        do {
            let response = try await getCatalogUseCase.execute()
            self.pizzas = response.catalog
            
            DispatchQueue.main.async {
                self.reloadTableView?()
            }
        } catch {
            print("Ошибка при загрузке пицц: \(error.localizedDescription)")
        }
    }
}

