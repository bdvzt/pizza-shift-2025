//
//  UserUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol UserUseCase {
    func execute(credentials: SignInDto) async throws -> SignInResponse
}

class UserUseCaseImpl: UserUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(credentials: SignInDto) async throws -> SignInResponse {
        return try await repository.signIn(credentials: credentials)
    }
}
