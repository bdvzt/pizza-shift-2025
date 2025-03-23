//
//  PizzaIngredient.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import Foundation

struct PizzaIngredient: Codable
{
    let name: IngredientName
    let cost: Int
    let img: String
    
    var imageIngredientUrl: String {
        return Const.baseUrl + img
    }
}
