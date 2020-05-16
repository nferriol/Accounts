//
//  AccountTest.swift
//  AccountsTests
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import XCTest
@testable import Accounts

class AccountTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecodeAccount() {
        let url1 = Bundle.main.url(forResource: "account1", withExtension: "json")!
        let data1 = try? Data(contentsOf: url1)
        var account1:Account?
        if let localData1 = data1 {
            account1 = try? JSONDecoder().decode(Account.self, from: localData1)
        }
        
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
        
        
        
        
        let url2 = Bundle.main.url(forResource: "account2", withExtension: "json")!
        let data2 = try? Data(contentsOf: url2)
        var account2:Account?
        if let localData2 = data2 {
            account2 = try? JSONDecoder().decode(Account.self, from: localData2)
        }
        
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
        
    
        
        
        let url3 = Bundle.main.url(forResource: "account3", withExtension: "json")!
        let data3 = try? Data(contentsOf: url3)
        var account3:Account?
        if let localData3 = data3 {
            account3 = try? JSONDecoder().decode(Account.self, from: localData3)
        }
        
        XCTAssertNotNil(account3)
        
        XCTAssertEqual(account3?.accountBalanceInCents, 15000)
        
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
    }
}
