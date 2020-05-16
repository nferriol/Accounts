//
//  TodayViewController.swift
//  AccountsWidget
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit
import NotificationCenter

class AccountsListWidgetViewController: AbstractAccountsListViewController, NCWidgetProviding, UITableViewDataSource {
    
    /// Widget height when is expanded
    let expandedHeight:CGFloat = 256.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        AccountsRouter.configureAccountsList(viewController: self)
        configureMyTableView()
    }
    
    /// Method invoke to configure the table view
    func configureMyTableView() {
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: AccountsListWidgetTableViewCell.reuseId)
        myTableView.register(UINib(nibName: "AccountsListWidgetTableViewCell", bundle: nil), forCellReuseIdentifier: AccountsListWidgetTableViewCell.reuseId)

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
        let cell: AccountsListWidgetTableViewCell

        cell = tableView.dequeueReusableCell(withIdentifier: AccountsListWidgetTableViewCell.reuseId, for: indexPath) as! AccountsListWidgetTableViewCell

        let model:AccountPresenterModel? = presenter?.getAccountModel(index: indexPath.row)

        if let localModel = model {
            cell.configure(model: localModel)
        }

        return cell
    }
    
    /// Method invoke when the active display mode changes.
    /// - Parameters:
    ///   - activeDisplayMode: The new active display mode
    ///   - maxSize: A CGSize object that represents the new maximum size this widget can have
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
      let expanded = activeDisplayMode == .expanded
      preferredContentSize = expanded ? CGSize(width: maxSize.width, height: expandedHeight) : maxSize
    }
}
