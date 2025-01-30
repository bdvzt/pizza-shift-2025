//
//  SignInUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol SignInUseCase {
    func execute(credentials: SignInDto) async throws -> SignInResponse
}

class SignInUseCaseImpl: SignInUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(credentials: SignInDto) async throws -> SignInResponse {
        return try await repository.signIn(credentials: credentials)
    }
}
