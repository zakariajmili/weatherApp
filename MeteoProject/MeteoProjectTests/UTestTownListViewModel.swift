//
//  UTestTownListViewModel.swift
//  Tests iOS
//
//  Created by zakariae jmili on 17/07/2022.
//

import XCTest

class UTestTownListViewModel: XCTestCase {
    
    
    func test_TownListViewModel_addItem() {
        let townListViewModel = TownListViewModel()
        let itemsCount = townListViewModel.items.count
        townListViewModel.addItem(name: "Paris")
        XCTAssertEqual(townListViewModel.items.count, itemsCount+1)
    }
    
    func test_TownListViewModel_removeItem() {
        let townListViewModel = TownListViewModel()
        let itemsCount = townListViewModel.items.count
        townListViewModel.deleteItem(indexSet: IndexSet(integer: 0))
        XCTAssertEqual(townListViewModel.items.count, itemsCount-1)
    }
    
}
