//
//  UserRepository.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol UserRepository {
    func signIn(credentials: SignInDto) async throws -> SignInResponse
}

class UserRepositoryImpl: UserRepository {
    private let networkService: NetworkServiceProtocol
    private let tokenStorage: TokenStorageProtocol
    
    init(networkService: NetworkServiceProtocol, tokenStorage: TokenStorageProtocol) {
        self.networkService = networkService
        self.tokenStorage = tokenStorage
    }
    
    func signIn(credentials: SignInDto) async throws -> SignInResponse {
        let signInResponse: SignInResponse = try await networkService.request(endPoint: SignInEndPoint.signIn(credentials), authorized: false)
        
        tokenStorage.saveToken(signInResponse.token)
        
        return signInResponse
    }
}

