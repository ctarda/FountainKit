//
//  CollectionViewDataSource.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//

import UIKit

/**
    Minimal implementation of the UICollectionViewDataSource protocol. This class only implements the ethods required by the protocol. This class can be subclassed to implement more of the UICollectionViewDataSource methods
*/
public class CollectionViewDataSource<T, U where T: DataManager, U: DataSettable, U: UICollectionViewCell, T.DataType == U.DataType>: NSObject, UICollectionViewDataSource {
    
    private let dataManager: T
    /**
     Designated initializer. 
     - parameter dataManager: An implementation of the DataManager protocol. In other words, the data collection that is going to populate this collectionview.
     - parameter cellType: The type of a UICollectionView subclass that also implements the DataSettable protocol. This parameter is required to enforce that the generic data type that the first parameter handles is the same as the data type that can be passed to the cell
    */
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