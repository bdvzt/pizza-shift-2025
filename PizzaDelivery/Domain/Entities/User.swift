//
//  User.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct User: Codable
{
    let phone: String
    let firstname: String?
    let lastname: String?
    let middlename: String?
    let email: String?
    let city: String?
}
