//
//  NetworkError.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

enum NetworkError: Error
{
    case invalidURL
    case invalidResponse
    case invalidData
    case requestFailed
}
