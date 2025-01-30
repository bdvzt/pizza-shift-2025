//
//  UpdateProfileUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol UpdateProfileUseCase {
    func execute(updateUserDto: UpdateProfileDto) async throws -> SessionResponse
}

class UpdateProfileUseCaseImpl: UpdateProfileUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(updateUserDto: UpdateProfileDto) async throws -> SessionResponse {
        return try await repository.updateProfile(updateUserDto: updateUserDto)
    }
}
