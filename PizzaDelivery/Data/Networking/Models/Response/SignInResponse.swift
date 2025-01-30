//
//  SignInResponse.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct SignInResponse: Decodable
{
    let success: Bool
    let reason: String?
    let user: UserDto
    let token: String
}
