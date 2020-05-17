//
//  AccountsListEntity.swift
//  Accounts
//
//  Created by Nadal Ferriol on 10/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AccountsListEntity: NSObject, AccountsListEntityProtocol {
    var accounts: Accounts?
    
    /// Method invoke to get the accounts array
    func getAccounts() -> [Account]? {
        if accounts == nil {
            let url = Bundle.main.url(forResource: "accounts", withExtension: "json")!
            let data = try? Data(contentsOf: url)
            if let localData = data {
                accounts = try? JSONDecoder().decode(Accounts.self, from: localData)
            }
        }
        
        return accounts?.accounts
    }
    
    /// Method invoke to get the visible accounts array
    func getVisibleAccounts() -> [Account]? {
        var returnValue: [Account]?
                
        if let localAccounts: [Account] = getAccounts() {
            let visibleAccounts = localAccounts.filter {
                $0.isVisible == true
            }
            
            returnValue = visibleAccounts
            
        }
        
        return returnValue
    }
    
    /// Method invoke to get a account by index
    /// - Parameter index: index of the account
    func getAccount(index: Int) -> Account? {
        var returnValue: Account?
        
        if accounts == nil {
            _ = getAccounts()
        }
        
        if let accountsList = accounts?.accounts, index < accountsList.count {
            returnValue = accountsList[index]
        }
        
        return returnValue
    }
    
    /// Method invoke to get a visible account by index
    /// - Parameter index: index of the account
    func getVisibleAccount(index: Int) -> Account? {
        var returnValue: Account?
        
        if accounts == nil {
            _ = getAccounts()
        }
        
        if let visibleAccounts = getVisibleAccounts() {
            if index < visibleAccounts.count {
                returnValue = visibleAccounts[index]
            }
        }
        
        return returnValue
    }
}
