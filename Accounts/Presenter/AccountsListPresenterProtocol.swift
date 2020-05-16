//
//  AccountsListPresenterProtocol.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

protocol AccountsListPresenterProtocol {
    
    /// View of the presenter
    var view: AccountsListViewControllerProtocol? {get set}
    /// Interactor of the presenter
    var interactor: AccountsListInteractorProtocol? {get set}
    
    /// Method invoke to reload accounts
    func reloadAccounts()
    /// Method invoke to get the number of accounts
    func numberOfAccounts() -> Int
    /// Method invoke to get the account presneter model
    /// - Parameter index: index of account
    func getAccountModel(index: Int) -> AccountPresenterModel
    /// Method invoke to change the visible accounts
    func changeVisibleAccounts()
    
    /// Method invoke to get the footer button title
    func getFooterButtonTitle() -> String?
}
