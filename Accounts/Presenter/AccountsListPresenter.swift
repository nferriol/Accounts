//
//  AccountsListPresenter.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

public class AccountsListPresenter: AccountsListPresenterProtocol {
    
    /// View of the presenter
    var view: AccountsListViewControllerProtocol?
    /// Interactor of the presenter
    var interactor: AccountsListInteractorProtocol?
    
    /// Method invoke to reload accounts
    func reloadAccounts() {
        view?.reloadAccounts()
    }
    
    /// Method invoke to get the number of accounts
    func numberOfAccounts() -> Int {
        var returnValue: Int = 0
        
        if let localInteractor = interactor {
            returnValue = localInteractor.numberOfAccounts()
        }
        
        return returnValue
    }
    
    /// Method invoke to get the account presneter model
    /// - Parameter index: index of account
    func getAccountModel(index: Int) -> AccountPresenterModel {
        var returnValue: AccountPresenterModel
        
        if let localModel:AccountPresenterModel = interactor?.getAccountModel(index: index) {
            returnValue = localModel
        }else{
            returnValue = AccountPresenterModel(name: "", iban: "", balanceInCents: 0)
        }
        
        return returnValue
    }
    
    /// Method invoke to change the visible accounts
    func changeVisibleAccounts() {
        interactor?.changeVisibleAccounts()
    }
    
    /// Method invoke to get the footer button title
    func getFooterButtonTitle() -> String? {
        return interactor?.getButtonTitle()
    }
}
