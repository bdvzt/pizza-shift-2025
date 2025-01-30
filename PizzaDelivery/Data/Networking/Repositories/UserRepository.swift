//
//  UserRepository.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol UserRepository {
    func signIn(credentials: SignInDto) async throws -> SignInResponse
    func getSession() async throws -> SessionResponse
    func updateProfile(updateUserDto: UpdateProfileDto) async throws -> SessionResponse
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
    
    func getSession() async throws -> SessionResponse {
        let sessionResponse: SessionResponse = try await networkService.request(endPoint: SessionEndPoint.session, authorized: true)
        
        return sessionResponse
    }
    
    func updateProfile(updateUserDto: UpdateProfileDto) async throws -> SessionResponse {
        let updateProfileResponse: SessionResponse = try await networkService.request(endPoint: UpdateProfileEndPoint.update(updateUserDto), authorized: true)
        
        return updateProfileResponse
    }
}

