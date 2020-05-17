//
//  AccountsListEntityProtocol.swift
//  Accounts
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

protocol AccountsListEntityProtocol {
    
    /// Accounts of the list
    var accounts: Accounts? {get set}
    
    /// Method invoke to get the accounts array
    func getAccounts() -> [Account]?
    /// Method invoke to get the visible accounts array
    func getVisibleAccounts() -> [Account]?
    /// Method invoke to get a account by index
    /// - Parameter index: index of the account
    func getAccount(index: Int) -> Account?
    /// Method invoke to get a visible account by index
    /// - Parameter index: index of the account
    func getVisibleAccount(index: Int) -> Account?
}
