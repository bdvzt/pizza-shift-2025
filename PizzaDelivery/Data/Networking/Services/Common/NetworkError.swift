//
//  NetworkError.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

public enum NetworkError: String, Error
{
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
    case invalidURL = "URL is invalid."
    case invalidResponse = "Response is invalid"
    case invalidData = "Data is invalid"
}
