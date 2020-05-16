//
//  AbstractAccountsListViewController.swift
//  Accounts
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AbstractAccountsListViewController: UIViewController, AccountsListViewControllerProtocol {
    /// Table view
    @IBOutlet var myTableView: UITableView!
    /// Footer button
    @IBOutlet var footerButton: UIButton!
    
    /// Pesenter of the view controller
    var presenter:AccountsListPresenterProtocol?
       
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateFooterButtonTitle()
    }
    
    /// Method invoke to reload accounts
    func reloadAccounts() {
        myTableView.reloadData()
        updateFooterButtonTitle()
    }
    
    /// Metthod invoke to updata footer button title
    func updateFooterButtonTitle() {
        let title:String = presenter?.getFooterButtonTitle() ?? ""
        footerButton.setTitle(title, for: UIControl.State.normal)
    }
    
    /// Method invoke when the footer button is pressed
    /// - Parameter sender: footer button
    @IBAction func footerButtonPressed(_ sender: Any) {
        presenter?.changeVisibleAccounts()
    }
}
