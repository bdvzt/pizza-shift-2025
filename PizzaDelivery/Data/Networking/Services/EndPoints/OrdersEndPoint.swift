//
//  OrdersEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

enum OrdersEndPoint: EndPointType {
    case orders

    var path: String {
        switch self {
        case .orders:
            return "pizza/orders"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        return .request
    }
}
