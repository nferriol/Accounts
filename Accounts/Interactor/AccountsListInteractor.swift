//
//  AccountListInteractor.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AccountsListInteractor: NSObject, AccountsListInteractorProtocol {
    
    /// Presenter of the interactor
    var presenter:AccountsListPresenterProtocol?
    /// Entity of the interactor
    var entity:AccountsListEntityProtocol?
    /// Define the visibility of the accounts
    var showOnlyVisible: Bool = false
    
    /// Method invoke to get number of accounts
    func numberOfAccounts() -> Int {
        var numberOfRows: Int = 0
        
        if showOnlyVisible {
            if let localAccounts = entity?.getVisibleAccounts() {
                numberOfRows = localAccounts.count
            }
        }else{
            if let localAccounts = entity?.getAccounts() {
                numberOfRows = localAccounts.count
            }
        }
        
        return numberOfRows
    }
    
    /// Method invoke to get account presenter model
    /// - Parameter index: index of account
    func getAccountModel(index: Int) -> AccountPresenterModel? {
        var returnValue: AccountPresenterModel? = nil
        
        var myAccount:Account? = nil
        
        if showOnlyVisible {
            myAccount = entity?.getVisibleAccount(index: index)
        }else{
            myAccount = entity?.getAccount(index: index)
        }
        
        if let localAccount = myAccount {
            let name: String = NSLocalizedString("Name", comment: "")
            let iban: String = NSLocalizedString("Iban", comment: "")
            
            let accountName:String = name + ": " + (localAccount.accountName ?? "")
            let accountIban:String = iban + ": " + (localAccount.iban ?? "")
            let accountBalance:Int = localAccount.accountBalanceInCents ?? 0

            let accountModel: AccountPresenterModel = AccountPresenterModel(name: accountName, iban: accountIban, balanceInCents: accountBalance)
                  
            returnValue = accountModel
        }
                            
        return returnValue
    }
    
    /// Method incoke to change the visible accounts
    func changeVisibleAccounts() {
        showOnlyVisible = !showOnlyVisible
        presenter?.reloadAccounts()
    }
    
    /// Method invoke to get the button title
    func getButtonTitle() -> String {
        let allAccounts: String = NSLocalizedString("See all accounts", comment: "")
        let visibleAccounts: String = NSLocalizedString("See visible accounts", comment: "")
        
        return showOnlyVisible ? allAccounts : visibleAccounts
    }
}
