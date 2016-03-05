//
//  FatArrayDataManagerTests.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//
import XCTest
@testable import FountainKit


class FlatArrayDataManagerTests: XCTestCase {
    private struct Constants {
        static let mockData = ["I", "pity", "the", "fool"]
    }
    
    private var dataManager: FlatArrayDataManager<String>?
    
    override func setUp() {
        super.setUp()
        dataManager = FlatArrayDataManager(data: Constants.mockData)
    }
    
    override func tearDown() {
        dataManager = nil
        super.tearDown()
    }
    
    func testItemCountIsCorrect() {
        XCTAssert(dataManager?.itemCount() == Constants.mockData.count, "Item count must be correct")
    }
    
    func testItemCountIsCorrectForFirstSection() {
        XCTAssert(dataManager?.itemCount(0) == Constants.mockData.count, "Item count must be correct")
    }
    
    func testItemCountReturnsNilForSectionsGreaterThatZero() {
        XCTAssertNil(dataManager?.itemCount(1))
    }
    
    func testItemAtIndexReturnsTheProperItem() {
        XCTAssertEqual(dataManager?.item(NSIndexPath(forRow: 0, inSection: 0)), Constants.mockData[0], "Item at index must return the proper value")
    }
    
    func testAddingDataReturnsProperCount() {
        dataManager?.append(Constants.mockData, toSection: 0)
        
        XCTAssertEqual(dataManager?.itemCount(), Constants.mockData.count * 2, "Append data must append new data")
    }
    
    func testUpdateUpdatesItemAtIndex() {
        let newValue = "Yo, yo yo!"
        let index = NSIndexPath(forRow: 0, inSection: 3)
        
        dataManager?.update(newValue, indexPath: index)
        
        XCTAssertEqual(dataManager?.item(index), newValue, "Update data must update data")
    }
    
    func testSectionCountReturns1() {
        XCTAssertTrue(dataManager?.sectionCount() == 1, "Section count must be 1")
    }
    
    func testClearEmptiesArray() {
        dataManager?.clear()
        XCTAssertEqual(dataManager?.itemCount(), 0)
    }
    
    func testClearSectionEmptiesArray() {
        dataManager?.clear(0)
        XCTAssertEqual(dataManager?.itemCount(), 0)
    }
    
    func testConvenienceInitializerInitializesEmptyCollection() {
        let convenieceManager = FlatArrayDataManager<String>()
        
        XCTAssertEqual(convenieceManager.itemCount(), 0, "Data collection must be empty")
    }
}
