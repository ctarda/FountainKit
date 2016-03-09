//
//  CollectionDataSourceTests.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//
@testable import FountainKit
import XCTest

class CollectionDataSourceTests: XCTestCase {
  private struct MockData {
    let mockField1: String
    let mockField2: String
  }
  
  private class MockCell: UICollectionViewCell, DataSettable {
    var outlet1: String?
    var outlet2: String?
    
    var data: MockData? {
      didSet {
        outlet1 = data?.mockField1
        outlet2 = data?.mockField2
      }
    }
  }
  
  private var dataSource: UICollectionViewDataSource?
  private var data: FlatArrayDataManager<MockData>?
  
  private let mockData = [MockData(mockField1: "1_1", mockField2: "1_2"), MockData(mockField1: "2_1", mockField2: "2_2")]
  private let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
  

    override func setUp() {
        super.setUp()
      data = FlatArrayDataManager(data: mockData)
      dataSource = CollectionViewDataSource(dataManager: data!, cellType: MockCell.self)
      collectionView.registerClass(MockCell.self, forCellWithReuseIdentifier: MockCell.cellReuseIdentifier())
      collectionView.dataSource = dataSource
    }
    
    override func tearDown() {
      dataSource = nil
      data = nil
        super.tearDown()
    }
    
    func testDataSourcePopulatesCell() {
      let cell = dataSource?.collectionView(collectionView, cellForItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0)) as? MockCell
      
      XCTAssertEqual(cell!.outlet1, mockData.first?.mockField1)
    }
    
  func testDataSourceReturnsCorrectItemCount() {
    let count = dataSource?.collectionView(collectionView, numberOfItemsInSection: 0)
    
    XCTAssertEqual(count, mockData.count)
  }
}
