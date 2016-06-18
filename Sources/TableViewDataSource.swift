//
//  TableViewDataSource.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//

import UIKit

/**
 Minimal implementation of the UITableViewDataSource protocol. This class only implements the ethods required by the protocol. This class can be subclassed to implement more of the UICollectionViewDataSource methods
 */
public class TableViewDataSource<T, U where T: DataManager, U: DataSettable, U: UITableViewCell, T.DataType == U.DataType>: NSObject, UITableViewDataSource {
    private let dataManager: T
    
    /**
     Designated initializer.
     - parameter dataManager: An implementation of the DataManager protocol. In other words, the data collection that is going to populate this collectionview.
     - parameter cellType: The type of a UITableViewCell subclass that also implements the DataSettable protocol. This parameter is required to enforce that the generic data type that the first parameter handles is the same as the data type that can be passed to the cell
     */
    public init(dataManager: T, cellType: U.Type) {
        self.dataManager = dataManager
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCell(withIdentifier: U.cellReuseIdentifier()) as? U {
            let dataItem = dataManager.item(indexPath)
            cell.data = dataItem;
            return cell
        }
        return U(style: .default, reuseIdentifier: U.cellReuseIdentifier())
    }
    
    public func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            guard let itemCount = dataManager.itemCount(section) else {
                return 0
            }
            return itemCount
    }
    
}
