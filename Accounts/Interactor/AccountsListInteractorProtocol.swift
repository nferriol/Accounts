//
//  AccountsListInteractorProtocol.swift
//  Accounts
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

protocol AccountsListInteractorProtocol {
    
    /// Presenter of the interactor
    var presenter:AccountsListPresenterProtocol? {get set}
    /// Entity of the interactor
    var entity:AccountsListEntityProtocol? {get set}
    
    /// Method invoke to get number of accounts
    func numberOfAccounts() -> Int
    /// Method invoke to get account presenter model
    /// - Parameter index: index of account
    func getAccountModel(index: Int) -> AccountPresenterModel?
    /// Method incoke to change the visible accounts
    func changeVisibleAccounts()
    /// Method invoke to get the button title
    func getButtonTitle() -> String 
}

