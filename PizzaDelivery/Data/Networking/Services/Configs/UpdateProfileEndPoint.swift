//
//  UpdateProfileEndPoint.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

enum UpdateProfileEndPoint: EndPointType {
    case update(UpdateProfileDto)
    
    var path: String {
        switch self {
        case .update:
            return "users/profile"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .patch
    }
    
    var task: HTTPTask {
        switch self {
        case .update(let updateProfileData):
            do {
                let jsonData = try JSONEncoder().encode(updateProfileData)
                return .requestBody(jsonData)
            } catch {
                return .request
            }
        }
    }
}
