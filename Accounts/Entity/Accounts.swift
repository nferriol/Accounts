//
//  Accounts.swift
//  Accounts
//
//  Created by Nadal Ferriol on 11/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import Foundation

struct Accounts: Decodable {
    var accounts: [Account]
    var failedAccountTypes: String?
    var returnCode: String?
}
