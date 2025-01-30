//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 27.01.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let getCatalogUseCase: GetCatalogUseCase
    private let payForPizzaUseCase: PayForPizzaUseCase
    private let signInUseCase: SignInUseCase
    private let getSessionUseCase: GetSessionUseCase
    private let updateProfileUseCase: UpdateProfileUseCase
    private let getOrdersUseCase: GetOrdersUseCase
    
    init(
        getCatalogUseCase: GetCatalogUseCase = GetCatalogUseCaseImpl(
            repository: CatalogRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage())
            )
        ),
        payForPizzaUseCase: PayForPizzaUseCase = PayForPizzaUseCaseImpl(
            repository: PizzaRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage())
            )
        ),
        signInUseCase: SignInUseCase = SignInUseCaseImpl(
            repository: UserRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage()),
                tokenStorage: UserDefaultsStorage()
            )
        ),
        getSessionUseCase: GetSessionUseCase = GetSessionUseCaseImpl(
            repository: UserRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage()),
                tokenStorage: UserDefaultsStorage()
            )
        ),
        updateProfileUseCase: UpdateProfileUseCase = UpdateProfileUseCaseImpl(
            repository: UserRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage()),
                tokenStorage: UserDefaultsStorage()
            )
        ),
        getOrdersUseCase: GetOrdersUseCase = GetOrdersUseCaseImpl(
            repository: PizzaRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage())
            )
        )
    ) {
        self.getCatalogUseCase = getCatalogUseCase
        self.payForPizzaUseCase = payForPizzaUseCase
        self.signInUseCase = signInUseCase
        self.getSessionUseCase = getSessionUseCase
        self.updateProfileUseCase = updateProfileUseCase
        self.getOrdersUseCase = getOrdersUseCase
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let getPizzasButton = createButton(title: "Get pizzas", action: #selector(fetchPizzasButtonTapped))
        let payButton = createButton(title: "Pay", action: #selector(payButtonTapped))
        let signInButton = createButton(title: "Sign in", action: #selector(signInButtonTapped))
        let getSessionButton = createButton(title: "Get Session", action: #selector(getSessionButtonTapped))
        let updateProfileButton = createButton(title: "Update Profile", action: #selector(updateProfileButtonTapped))
        let getOrdersButton = createButton(title: "Get Orders", action: #selector(getOrdersButtonTapped))
        
        let stackView = UIStackView(arrangedSubviews: [getPizzasButton, payButton, signInButton, getSessionButton, updateProfileButton, getOrdersButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        return button
    }
    
    @objc private func fetchPizzasButtonTapped() {
        Task { await getPizzas() }
    }
    
    @objc private func payButtonTapped() {
        Task { await payForPizzas() }
    }
    
    @objc private func signInButtonTapped() {
        Task { await signIn() }
    }
    
    @objc private func getSessionButtonTapped() {
        Task { await getSession() }
    }
    
    @objc private func updateProfileButtonTapped() {
        Task { await updateProfile() }
    }
    
    @objc private func getOrdersButtonTapped() {
        Task { await getOrders() }
    }
    
    private func getPizzas() async {
        do {
            let pizzasResponse = try await getCatalogUseCase.execute()
            print(pizzasResponse.catalog)
        } catch {
            print("Error fetching pizzas: \(error)")
        }
    }
    
    private func payForPizzas() async {
        do {
            let paymentResponse = try await payForPizzaUseCase.execute(order: MockData.testPaymentDto)
            print(paymentResponse)
        } catch {
            print("Payment error: \(error)")
        }
    }
    
    private func signIn() async {
        do {
            let signInResponse = try await signInUseCase.execute(credentials: MockData.signInDto)
            print(signInResponse)
        } catch {
            print("Sign in error: \(error)")
        }
    }
    
    private func getSession() async {
        do {
            let sessionResponse = try await getSessionUseCase.execute()
            print("Session info: \(sessionResponse)")
        } catch {
            print("Session error: \(error)")
        }
    }
    
    private func updateProfile() async {
        do {
            let updateResponse = try await updateProfileUseCase.execute(updateUserDto: MockData.updateProfileDto)
            print(updateResponse)
        } catch {
            print("Profile update error: \(error)")
        }
    }
    
    private func getOrders() async {
        do {
            let ordersResponse = try await getOrdersUseCase.execute()
            print("Orders: \(ordersResponse)")
        } catch {
            print("Error fetching orders: \(error)")
        }
    }
}

#Preview {
    ViewController()
}
