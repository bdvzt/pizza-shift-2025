//
//  AuthService.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

class AuthService
{
    private let signInDto = SignInDto(
        phone: "89990009990",
        code: 430325
    )
    
    func signIn() async throws -> SignInResponse
    {
        let signInEndpoint = "https://shift-intensive.ru/api/users/signin"
        
        guard let url = URL(string: signInEndpoint) else { throw NetworkError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(signInDto)
        } catch {
            throw NetworkError.invalidData
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let signInResponse = try decoder.decode(SignInResponse.self, from: data)
            
            return signInResponse
        } catch {
            throw NetworkError.invalidData
        }
    }
}
