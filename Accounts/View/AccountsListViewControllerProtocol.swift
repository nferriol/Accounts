//
//  AccountsListViewControllerProtocol.swift
//  Accounts
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

protocol AccountsListViewControllerProtocol {
    
    /// Presenter of the view
    var presenter:AccountsListPresenterProtocol? {get set}
    
    /// Method invoke to reload accounts
    func reloadAccounts()
}
