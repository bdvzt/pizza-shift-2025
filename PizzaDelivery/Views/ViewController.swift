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
    private let signInUseCase: UserUseCase
    
    init(
        getCatalogUseCase: GetCatalogUseCase = GetCatalogUseCaseImpl(
            repository: CatalogRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage())
            )
        ),
        payForPizzaUseCase: PayForPizzaUseCase = PayForPizzaUseCaseImpl(
            repository: PaymentRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage())
            )
        ),
        signInUseCase: UserUseCase = UserUseCaseImpl(
            repository: UserRepositoryImpl(
                networkService: NetworkService(tokenStorage: UserDefaultsStorage()),
                tokenStorage: UserDefaultsStorage()
            )
        )
    ) {
        self.getCatalogUseCase = getCatalogUseCase
        self.payForPizzaUseCase = payForPizzaUseCase
        self.signInUseCase = signInUseCase
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
        
        let stackView = UIStackView(arrangedSubviews: [getPizzasButton, payButton, signInButton])
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
}

#Preview {
    ViewController()
}
