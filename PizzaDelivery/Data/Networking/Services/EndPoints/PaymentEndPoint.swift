//
//  PaymentEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

enum PaymentEndPoint: EndPointType {
    case pay(CreatePizzaPaymentDto)
    
    var path: String {
        switch self {
        case .pay:
            return "pizza/payment"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .pay(let paymentData):
            do {
                let jsonData = try JSONEncoder().encode(paymentData)
                return .requestBody(jsonData)
            } catch {
                return .request
            }
        }
    }
}
