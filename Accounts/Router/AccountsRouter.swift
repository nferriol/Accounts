//
//  AccountsRouter.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AccountsRouter: NSObject {
    
    /// Method invoke to get the main storyboard
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    /// Method invoke to configure the account list
    /// - Parameter viewController: account list view controller protocol
    static func configureAccountsList(viewController: AccountsListViewControllerProtocol) {
        
        var localViewController: AccountsListViewControllerProtocol = viewController
        var accountsListPresenter: AccountsListPresenterProtocol = AccountsListPresenter()
        var accountsListInteractor: AccountsListInteractorProtocol = AccountsListInteractor()
        let accountsListEntity: AccountsListEntityProtocol = AccountsListEntity()
        
        localViewController.presenter = accountsListPresenter
        accountsListPresenter.view = localViewController
        accountsListPresenter.interactor = accountsListInteractor
        accountsListInteractor.presenter = accountsListPresenter
        accountsListInteractor.entity = accountsListEntity
    }
}
