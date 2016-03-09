//
//  CollectionViewDataSource.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit

public class CollectionViewDataSource<T, U where T: DataManager, U: DataSettable, U: UICollectionViewCell, T.DataType == U.DataType>: NSObject, UICollectionViewDataSource {
  
  private let dataManager: T
  
  init(dataManager: T, cellType: U.Type) {
    self.dataManager = dataManager
  }
  
  public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let itemCount = dataManager.itemCount(section) else {
      return 0
    }
    return itemCount
  }
  
  public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if var cell = collectionView.dequeueReusableCellWithReuseIdentifier(U.cellReuseIdentifier(), forIndexPath: indexPath) as? U {
      let dataItem = dataManager.item(indexPath)
      cell.data = dataItem;
      return cell
    }
    
    return U()
  }
}