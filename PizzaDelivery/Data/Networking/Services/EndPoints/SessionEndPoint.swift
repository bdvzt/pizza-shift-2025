//
//  SessionEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

enum SessionEndPoint: EndPointType {
    case session
    
    var path: String {
        switch self {
        case .session:
            return "users/session"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
}
