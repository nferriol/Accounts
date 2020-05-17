//
//  AccountsListWidgetTableViewCell.swift
//  AccountsWidget
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import UIKit

class AccountsListWidgetTableViewCell: UITableViewCell {

    /// Name of the account
    @IBOutlet var name: UILabel!
    /// IBAN of the account
    @IBOutlet var iban: UILabel!
    /// Balance of the account
    @IBOutlet var balance: UILabel!
    
    /// Reuse identifier
    static let reuseId: String = "AccountsListWidgetCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /// Method invoke to configure the cell
    /// - Parameter model: Model of the account
    public func configure(model: AccountPresenterModel) {
        name.text = model.name
        iban.text = model.iban
        balance.text = String(model.balanceInCents)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
