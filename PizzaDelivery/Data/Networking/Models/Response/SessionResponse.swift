//
//  SessionResponse.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

struct SessionResponse: Decodable
{
    let success: Bool
    let reason: String?
    let user: UserDto
}
