//
//  AccountsListInteractorTests.swift
//  AccountsTests
//
//  Created by Nadal Ferriol on 13/02/2020.
//  Copyright © 2020 Nadal Ferriol. All rights reserved.
//

import XCTest

@testable import Accounts

class AccountsListInteractorTests: XCTestCase {
    
    let interactor: AccountsListInteractor = AccountsListInteractor()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func configureInteractor() {
        if interactor.entity == nil {
            interactor.entity = AccountsListEntity()
        }
    }

    func testNumberOfAccounts() {
        configureInteractor()
        
        XCTAssertEqual(interactor.numberOfAccounts(), 3)

        interactor.changeVisibleAccounts()
        
        XCTAssertEqual(interactor.numberOfAccounts(), 2)
    }
    
    func testGetAccountModel() {
        configureInteractor()
        
        var model1 = interactor.getAccountModel(index: 0)
        var model2 = interactor.getAccountModel(index: 1)
        let model3 = interactor.getAccountModel(index: 2)

        XCTAssertEqual(model1?.name, "Name: Hr P L G N StellingTD")
        XCTAssertEqual(model2?.name, "Name: ,")
        XCTAssertEqual(model3?.name, "Name: ")

        model1 = interactor.getAccountModel(index: 0)
        model2 = interactor.getAccountModel(index: 1)
        
        XCTAssertEqual(model1?.name, "Name: Hr P L G N StellingTD")
        XCTAssertEqual(model2?.name, "Name: ,")
    }
    
    func testChangeVisibleAccounts() {
        XCTAssertEqual(interactor.showOnlyVisible, false)

        interactor.changeVisibleAccounts()
        
        XCTAssertEqual(interactor.showOnlyVisible, true)
    }
    
    func testGetButtonTitle() {
        XCTAssertEqual(interactor.getButtonTitle(), "Ver cuentas visibles")
        
        interactor.changeVisibleAccounts()
        
        XCTAssertEqual(interactor.getButtonTitle(), "Ver todas las cuentas")
    }
}
