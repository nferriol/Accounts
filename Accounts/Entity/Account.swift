//
//  Account.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import Foundation

struct Account {
    var accountBalanceInCents: Int?
    var accountCurrency: String?
    var accountId: Int?
    var accountName: String?
    var accountNumber: String?
    var accountType: String?
    var alias: String?
    var iban: String?
    var isVisible: Bool?
    var linkedAccountId: Int?
    var productName: String?
    var productType: Int?
    var savingsTargetReached: Int?
    var targetAmountInCents: Int?
}

extension Account: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case accountBalanceInCents, accountId, linkedAccountId, productType, savingsTargetReached, targetAmountInCents
        case accountCurrency, accountName, accountNumber, accountType, alias, iban, productName
        case isVisible
    }
    
    /// Custon decoder accounts
    /// - Parameter decoder: decoder
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        //Define decorder account number in function to the type
        if let localAccountNumber = try? values.decode(String.self, forKey: .accountNumber) {
            accountNumber = localAccountNumber
        } else if let localAccountNumber = try? values.decode(Int.self, forKey: .accountNumber) {
            accountNumber = String(localAccountNumber)
        }
        
        accountBalanceInCents = try? values.decode(Int.self, forKey: .accountBalanceInCents)
        accountCurrency = try? values.decode(String.self, forKey: .accountCurrency)
        accountId = try? values.decode(Int.self, forKey: .accountId)
        accountName = try? values.decode(String.self, forKey: .accountName)
        accountType = try? values.decode(String.self, forKey: .accountType)
        alias = try? values.decode(String.self, forKey: .alias)
        iban = try? values.decode(String.self, forKey: .iban)
        isVisible = try? values.decode(Bool.self, forKey: .isVisible)
        linkedAccountId = try? values.decode(Int.self, forKey: .linkedAccountId)
        productName = try? values.decode(String.self, forKey: .productName)
        productType = try? values.decode(Int.self, forKey: .productType)
        savingsTargetReached = try? values.decode(Int.self, forKey: .savingsTargetReached)
        targetAmountInCents = try? values.decode(Int.self, forKey: .targetAmountInCents)
    }
}
