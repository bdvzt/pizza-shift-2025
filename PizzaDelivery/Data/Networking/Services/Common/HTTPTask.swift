//
//  HTTPTask.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

public typealias HTTPHeaders = [String:String]

enum HTTPTask
{
    case request
    case requestBody(Data)
}
