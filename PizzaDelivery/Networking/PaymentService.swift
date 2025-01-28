//
//  PaymentService.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

class PaymentService
{
    let createPizzaPaymentDto = CreatePizzaPaymentDto(
        receiverAddress: CreatePizzaPaymentAddressDto(
            street: "street",
            house: "house",
            apartment: "apartment",
            comment: "comment"
        ),
        person: CreatePizzaPaymentPersonDto(
            firstname: "firstname",
            lastname: "lastname",
            middlename: "middlename",
            phone: "89990009999"
        ),
        debitCard: CreatePizzaPaymentDebitCardDto(
            pan: "1111 1111",
            expireDate: "11/11",
            cvv: "111"
        ),
        pizzas: [
            OrderedPizza(
                id: "1",
                name: "string",
                toppings: [
                    OrderedPizzaIngredient(
                        name: .PINEAPPLE,
                        cost: 0
                    )
                ],
                size: PizzaSize(
                    name: .SMALL,
                    price: 0
                ),
                doughs: PizzaDough(
                    name: .THIN,
                    price: 0
                )
            )
        ]
    )
    
    func pay() async throws -> PizzaPaymentResponse
    {
        let paymentEndpoint = "https://shift-intensive.ru/api/pizza/payment"
        
        guard let url = URL(string: paymentEndpoint) else { throw NetworkError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(createPizzaPaymentDto)
        } catch {
            throw NetworkError.invalidData
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let paymentResponse = try decoder.decode(PizzaPaymentResponse.self, from: data)
            
            return paymentResponse
        } catch {
            throw NetworkError.invalidData
        }
    }
}
