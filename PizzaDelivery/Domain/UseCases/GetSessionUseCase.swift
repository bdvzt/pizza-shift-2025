//
//  GetSessionUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol GetSessionUseCase {
    func execute() async throws -> SessionResponse
}

class GetSessionUseCaseImpl: GetSessionUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> SessionResponse {
        return try await repository.getSession()
    }
}
