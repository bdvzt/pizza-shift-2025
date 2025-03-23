//
//  IngredientName.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import Foundation

enum IngredientName: String, Codable
{
    case PINEAPPLE
    case MOZZARELLA
    case PEPERONI
    case GREEN_PEPPER
    case MUSHROOMS
    case BASIL
    case CHEDDAR
    case PARMESAN
    case FETA
    case HAM
    case PICKLE
    case TOMATO
    case BACON
    case ONION
    case CHILE
    case SHRIMPS
    case CHICKEN_FILLET
    case MEATBALLS
}

public func translateIngredient(ingredient: String) -> String {
    if ingredient == "PINEAPPLE" {
        return "ананас"
    } else if ingredient == "MOZZARELLA" {
        return "моцарелла"
    } else if ingredient == "PEPERONI" {
        return "пепперони"
    } else if ingredient == "GREEN_PEPPER" {
        return "зелёный перец"
    } else if ingredient == "MUSHROOMS" {
        return "грибы"
    } else if ingredient == "BASIL" {
        return "базилик"
    } else if ingredient == "CHEDDAR" {
        return "чеддер"
    } else if ingredient == "PARMESAN" {
        return "пармезан"
    } else if ingredient == "FETA" {
        return "фета"
    } else if ingredient == "HAM" {
        return "ветчина"
    } else if ingredient == "PICKLE" {
        return "огурцы"
    } else if ingredient == "TOMATO" {
        return "помидор"
    } else if ingredient == "BACON" {
        return "бекон"
    } else if ingredient == "ONION" {
        return "лук"
    } else if ingredient == "CHILE" {
        return "перец чили"
    } else if ingredient == "SHRIMPS" {
        return "креветки"
    } else if ingredient == "CHICKEN_FILLET" {
        return "куриное филе"
    } else if ingredient == "MEATBALLS" {
        return "фрикадельки"
    } else {
        return ingredient
    }
}

//enum IngredientName: String, Codable {
//    case PINEAPPLE = "ананас"
//    case MOZZARELLA = "моцарелла"
//    case PEPERONI = "пепперони"
//    case GREEN_PEPPER = "зелёный перец"
//    case MUSHROOMS = "грибы"
//    case BASIL = "базилик"
//    case CHEDDAR = "чеддер"
//    case PARMESAN = "пармезан"
//    case FETA = "фета"
//    case HAM = "ветчина"
//    case PICKLE = "огурцы"
//    case TOMATO = "помидор"
//    case BACON = "бекон"
//    case ONION = "лук"
//    case CHILE = "перец чили"
//    case SHRIMPS = "креветки"
//    case CHICKEN_FILLET = "куриное филе"
//    case MEATBALLS = "фрикадельки"
//}
//
//extension IngredientName {
//    var localizedName: String {
//        return self.rawValue
//    }
//}
