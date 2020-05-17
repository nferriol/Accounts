//
//  AccountsListEntityTest.swift
//  AccountsTests
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import XCTest

@testable import Accounts

class AccountsListEntityTest: XCTestCase {
    
    let entity: AccountsListEntity = AccountsListEntity()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAccounts() {
        let accounts: [Account]? = entity.getAccounts()
        
        XCTAssertNotNil(accounts)
        
        XCTAssertEqual(accounts?.count, 3)

        XCTAssertEqual(accounts?[0].accountId, 748757694)
        XCTAssertEqual(accounts?[1].accountId, 700000027559)
        XCTAssertEqual(accounts?[2].accountId, 700000027559)
    }
       
    func testGetVisibleAccounts() {
        let accounts: [Account]? = entity.getVisibleAccounts()
           
        XCTAssertNotNil(accounts)
        
        XCTAssertEqual(accounts?.count, 2)
           
        XCTAssertEqual(accounts?[0].accountId, 748757694)
        XCTAssertEqual(accounts?[1].accountId, 700000027559)
    }
       
    func testGetAccount() {
        let account1: Account? = entity.getAccount(index: 0)
        let account2: Account? = entity.getAccount(index: 1)
        let account3: Account? = entity.getAccount(index: 2)

        XCTAssertNotNil(account1)
        XCTAssertNotNil(account2)
        XCTAssertNotNil(account3)

        XCTAssertEqual(account1?.accountId, 748757694)
        XCTAssertEqual(account2?.accountId, 700000027559)
        XCTAssertEqual(account3?.accountId, 700000027559)
    }
       
    func testGetVisibleAccount() {        
        let account1: Account? = entity.getVisibleAccount(index: 0)
        let account2: Account? = entity.getVisibleAccount(index: 1)

        XCTAssertNotNil(account1)
        XCTAssertNotNil(account2)

        XCTAssertEqual(account1?.accountId, 748757694)
        XCTAssertEqual(account2?.accountId, 700000027559)
    }
}
