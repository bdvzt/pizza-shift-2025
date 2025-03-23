//
//  StatusCode.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

enum HTTPStatusCode: Int
{
    case Ok = 200
    case Created = 201
    case BadRequest = 400
    case Unauthorized = 401
    case Forbidden = 403
    case NotFound = 404
    case InternalServerError = 500
}
