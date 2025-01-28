//
//  GetCatalogService.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

class GetCatalogService
{
    func getCatalog() async throws -> PizzasResponse
    {
        let catalogEndpoint = "https://shift-intensive.ru/api/pizza/catalog"
        
        guard let url = URL(string: catalogEndpoint) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let pizzasResponse = try decoder.decode(PizzasResponse.self, from: data)
            
            return pizzasResponse
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}

