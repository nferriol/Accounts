//
//  ViewController.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AccountsListViewController: AbstractAccountsListViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMyTableView()
    }
    
    /// Method invoke to configure the table view
    func configureMyTableView() {
        let reuseId: String = AccountsListTableViewCell.reuseId
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: AccountsListTableViewCell.reuseId)
        myTableView.register(UINib(nibName: "AccountsListTableViewCell", bundle: nil), forCellReuseIdentifier: reuseId)
        
        myTableView.rowHeight = UITableView.automaticDimension

        myTableView.dataSource = self
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows: Int = 0
        
        if let localPresenter = presenter {
            numberOfRows = localPresenter.numberOfAccounts()
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AccountsListTableViewCell
        let reuseId: String = AccountsListTableViewCell.reuseId

        let accountsCell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        if let localAccountsCell = accountsCell as? AccountsListTableViewCell {
            cell = localAccountsCell
        } else {
            cell = AccountsListTableViewCell()
        }

        let model: AccountPresenterModel? = presenter?.getAccountModel(index: indexPath.row)
        
        if let localModel = model {
            cell.configure(model: localModel)
        }
        
        return cell
    }
}
