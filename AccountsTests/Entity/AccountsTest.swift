//
//  AccountsTest.swift
//  AccountsTests
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import XCTest

@testable import Accounts

class AccountsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecodeAccounts() {
        let url = Bundle.main.url(forResource: "accounts", withExtension: "json")!
        let data = try? Data(contentsOf: url)
        var accounts:Accounts?
        if let localData = data {
            accounts = try? JSONDecoder().decode(Accounts.self, from: localData)
        }
        
        let account1, account2, account3:Account?
        
        XCTAssertNotNil(accounts)
        XCTAssertNotNil(accounts?.accounts)

        account1 = accounts?.accounts[0]
        account2 = accounts?.accounts[1]
        account3 = accounts?.accounts[2]
        
        XCTAssertNotNil(account1)
        
        XCTAssertEqual(account1?.accountBalanceInCents, 985000)
        XCTAssertEqual(account1?.accountCurrency, "EUR")
        XCTAssertEqual(account1?.accountId, 748757694)
        XCTAssertEqual(account1?.accountName, "Hr P L G N StellingTD")
        XCTAssertEqual(account1?.accountNumber, "748757694")
        XCTAssertEqual(account1?.accountType, "PAYMENT")
        XCTAssertEqual(account1?.alias, "")
        XCTAssertEqual(account1?.isVisible, true)
        XCTAssertEqual(account1?.iban, "NL23INGB0748757694")
        
        XCTAssertNotNil(account2)
        XCTAssertEqual(account2?.accountBalanceInCents, 1000000)
        XCTAssertEqual(account2?.accountCurrency, "EUR")
        XCTAssertEqual(account2?.accountId, 700000027559)
        XCTAssertEqual(account2?.accountName, ",")
        XCTAssertEqual(account2?.accountNumber, "748757732")
        XCTAssertEqual(account2?.accountType, "PAYMENT")
        XCTAssertEqual(account2?.alias, "")
        XCTAssertEqual(account2?.isVisible, false)
        XCTAssertEqual(account2?.iban, "NL88INGB0748757732")
        
        XCTAssertNotNil(account3)
                
        XCTAssertEqual(account3?.accountBalanceInCents, 15000)
        XCTAssertEqual(account3?.accountCurrency, "EUR")
        XCTAssertEqual(account3?.accountId, 700000027559)
        XCTAssertEqual(account3?.accountName, "")
        XCTAssertEqual(account3?.accountNumber, "H 177-27066")
        XCTAssertEqual(account3?.accountType, "SAVING")
        XCTAssertEqual(account3?.alias, "G\\UfffdLSAVINGSdiacrits")
        XCTAssertEqual(account3?.iban, "")
        XCTAssertEqual(account3?.isVisible, true)
        XCTAssertEqual(account3?.linkedAccountId, 748757694)
        XCTAssertEqual(account3?.productName, "Oranje Spaarrekening")
        XCTAssertEqual(account3?.productType, 1000)
        XCTAssertEqual(account3?.savingsTargetReached, 1)
        XCTAssertEqual(account3?.targetAmountInCents, 2000)
        
        XCTAssertEqual(accounts?.failedAccountTypes, "CREDITCARDS")
        XCTAssertEqual(accounts?.returnCode, "OK")
    }
}
