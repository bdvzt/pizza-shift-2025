//
//  OrderedPizza.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct OrderedPizza
{
    let id: String
    let name: String
    let toppings: [OrderedPizzaIngredient]
    let size: PizzaSize
    let doughs: PizzaDough
}
