//
//  AccountPresenterModel.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import Foundation

struct AccountPresenterModel {
    /// Name of the account
    var name: String
    /// IBAN of the account
    var iban: String
    /// Balance of the account
    var balanceInCents: Int
    
    /// Init account presenter model
    /// - Parameters:
    ///   - name: name of the account
    ///   - iban: iban of the account
    ///   - balanceInCents: balance of the accont in cents
    public init(name: String, iban: String, balanceInCents: Int) {
        (self.name, self.iban, self.balanceInCents) = (name, iban, balanceInCents)
    }
}
