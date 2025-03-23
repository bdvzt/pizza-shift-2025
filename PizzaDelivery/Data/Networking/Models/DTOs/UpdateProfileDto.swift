//
//  UpdateProfileDto.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

struct UpdateProfileDto: Codable
{
    let profile: UpdateUserDto
    let phone: String
}
