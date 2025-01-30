//
//  MockData.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

struct MockData {
    static let testPaymentDto = CreatePizzaPaymentDto(
        receiverAddress: CreatePizzaPaymentAddressDto(
            street: "street",
            house: "house",
            apartment: "apartment",
            comment: "comment"
        ),
        person: CreatePizzaPaymentPersonDto(
            firstname: "firstname",
            lastname: "lastname",
            middlename: "middlename",
            phone: "89990009999"
        ),
        debitCard: CreatePizzaPaymentDebitCardDto(
            pan: "1111 1111",
            expireDate: "11/11",
            cvv: "111"
        ),
        pizzas: [
            OrderedPizza(
                id: "1",
                name: "string",
                toppings: [
                    OrderedPizzaIngredient(
                        name: .PINEAPPLE,
                        cost: 0
                    )
                ],
                size: PizzaSize(
                    name: .SMALL,
                    price: 0
                ),
                doughs: PizzaDough(
                    name: .THIN,
                    price: 0
                )
            )
        ]
    )
    
    static let signInDto = SignInDto(
        phone: "89244527680",
        code: 217115
    )
    
    static let updateProfileDto = UpdateProfileDto(
        profile: UpdateUserDto(
            firstname: "Заятик",
            lastname: "Будаева",
            middlename: "ыАААА",
            email: "budaevazay@mail.ru",
            city: "ulan-ude"
        ),
        phone: "89244527680"
    )
}
