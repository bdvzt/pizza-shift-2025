//
//  DependencyInjection.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

class DependencyInjection {
    let tokenStorage: TokenStorageProtocol
    let networkService: NetworkServiceProtocol
    
    let catalogRepository: CatalogRepository
    let userRepository: UserRepository
    let pizzaRepository: PizzaRepository
    
    let catalogUseCase: GetCatalogUseCase
    let paymentUseCase: PaymentUseCase
    let ordersUseCase: GetOrdersUseCase
    
    let signInUseCase: SignInUseCase
    let getSessionUseCase: GetSessionUseCase
    let updateProfileUseCase: UpdateProfileUseCase
    
    init() {
        self.tokenStorage = UserDefaultsStorage()
        self.networkService = NetworkService(tokenStorage: tokenStorage)
        
        self.catalogRepository = CatalogRepositoryImpl(networkService: networkService)
        self.userRepository = UserRepositoryImpl(networkService: networkService, tokenStorage: tokenStorage)
        self.pizzaRepository = PizzaRepositoryImpl(networkService: networkService)
        
        self.catalogUseCase = GetCatalogUseCaseImpl(repository: catalogRepository)
        self.paymentUseCase = PaymentUseCaseImpl(repository: pizzaRepository)
        self.ordersUseCase = GetOrdersUseCaseImpl(repository: pizzaRepository)
        self.signInUseCase = SignInUseCaseImpl(repository: userRepository)
        self.getSessionUseCase = GetSessionUseCaseImpl(repository: userRepository)
        self.updateProfileUseCase = UpdateProfileUseCaseImpl(repository: userRepository)
    }
}
