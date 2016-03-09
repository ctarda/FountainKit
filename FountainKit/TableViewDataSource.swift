//
//  TableViewDataSource.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit

public class TableViewDataSource<T, U where T: DataManager, U: DataSettable, U: UITableViewCell, T.DataType == U.DataType>: NSObject, UITableViewDataSource {
    private let dataManager: T
    
  init(dataManager: T, cellType: U.Type) {
        self.dataManager = dataManager
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCellWithIdentifier(U.cellReuseIdentifier()) as? U {
            let dataItem = dataManager.item(indexPath)
            cell.data = dataItem;
            return cell
        }
        return U(style: .Default, reuseIdentifier: U.cellReuseIdentifier())
    }
    
    public func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
          guard let itemCount = dataManager.itemCount(section) else {
            return 0
          }
        return itemCount
    }
    
}