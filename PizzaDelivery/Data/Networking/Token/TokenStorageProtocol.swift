//
//  TokenStorageProtocol.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol TokenStorageProtocol {
    func saveToken(_ token: String)
    func retrieveToken() -> String?
    func deleteToken()
}


class UserDefaultsStorage: TokenStorageProtocol {
    private let tokenKey = "token"

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }

    func retrieveToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }

    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
