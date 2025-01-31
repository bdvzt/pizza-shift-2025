//
//  CatalogEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

enum CatalogEndPoint: EndPointType {
    case getCatalog

    var path: String {
        switch self {
        case .getCatalog:
            return "pizza/catalog"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        return .request
    }
}
