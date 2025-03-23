//
//  NetworkError.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

public enum NetworkError: Error
{
    case wrongURL
    case invalidResponse
    case invalidData
    case wrongOtp
    case decodingError
    case encodingError
    
    case methodNotAllowed
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case unknown
}
