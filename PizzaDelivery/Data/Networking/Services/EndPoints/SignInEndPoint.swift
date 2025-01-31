//
//  SignInEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

enum SignInEndPoint: EndPointType {
    case signIn(SignInDto)
    
    var path: String {
        switch self {
        case .signIn:
            return "users/signin"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .signIn(let credentials):
            return .requestBody(try! JSONEncoder().encode(credentials))
        }
    }
}
