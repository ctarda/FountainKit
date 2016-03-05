//
//  TableViewDataSource.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit

public class TableViewDataSource<T: DataManager, U where U: DataSettable, U: UITableViewCell, T.DataType == U.DataType>: NSObject, UITableViewDataSource {
    private let dataManager: T
    
    init(dataManager: T) {
        self.dataManager = dataManager
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? U {
            let dataItem = dataManager.item(indexPath)
            cell.data = dataItem;
            return cell
        }
        return U(style: .Default, reuseIdentifier: "cell")
    }
    
    public func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return dataManager.sectionCount()
    }
    
}