//
//  TableDataSourceTests.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import XCTest
@testable import FountainKit

struct MockData {
  let mockField1: String
  let mockField2: String
}

class MockCell: UITableViewCell, DataSettable {
  var outlet1: String?
  var outlet2: String?
  
  var data: MockData? {
    didSet {
      outlet1 = data?.mockField1
      outlet2 = data?.mockField2
    }
  }
}

class TableDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataSourcePopulatesCell() {
      let mockData = [MockData(mockField1: "1_1", mockField2: "1_2"), MockData(mockField1: "2_1", mockField2: "2_2")]
      let data = FlatArrayDataManager(data: mockData)
      let dataSource = TableViewDataSource(dataManager: data, cellType: MockCell.self)
      let tableView = UITableView()
      tableView.registerClass(MockCell.self, forCellReuseIdentifier: MockCell.cellReuseIdentifier())
      
      let cell = dataSource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0)) as? MockCell
      
      XCTAssertEqual(cell!.outlet1, mockData.first?.mockField1)
    }
  
  func testDataSourceReturnsCorrectDataCount() {
    let mockData = [MockData(mockField1: "1_1", mockField2: "1_2"), MockData(mockField1: "2_1", mockField2: "2_2")]
    let data = FlatArrayDataManager(data: mockData)
    let dataSource = TableViewDataSource(dataManager: data, cellType: MockCell.self)
    let tableView = UITableView()
    tableView.registerClass(MockCell.self, forCellReuseIdentifier: MockCell.cellReuseIdentifier())
    
    let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
    
      XCTAssertEqual(count, mockData.count)
  }
}
