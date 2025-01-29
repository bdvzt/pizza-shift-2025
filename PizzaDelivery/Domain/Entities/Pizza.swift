//
//  Pizza.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import Foundation

struct Pizza: Codable
{
    let id: String
    let name: String
    let ingredients: [PizzaIngredient]
    let toppings: [PizzaIngredient]
    let description: String
    let sizes: [PizzaSize]
    let doughs: [PizzaDough]
    let calories: Int
    let protein: String
    let totalFat: String
    let carbohydrates: String
    let sodium: String
    let allergens: [String]
    let isVegetarian: Bool
    let isGlutenFree: Bool
    let isNew: Bool
    let isHit: Bool
    let img: String
}
