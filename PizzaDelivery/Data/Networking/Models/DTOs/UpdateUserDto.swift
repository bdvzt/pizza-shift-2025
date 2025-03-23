//
//  UpdateUserDto.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

struct UpdateUserDto: Codable
{
    let firstname: String?
    let lastname: String?
    let middlename: String?
    let email: String?
    let city: String?
}
