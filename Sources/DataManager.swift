//
//  DataManager.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import Foundation

protocol DataManager {
    typealias DataType
    
    func itemCount() -> Int
    func itemCount(section: Int) -> Int?
    func sectionCount() -> Int
    
    func item(indexPath: NSIndexPath) -> DataType
    func append(newData: [DataType], toSection: Int)
    func update(item: DataType, indexPath: NSIndexPath)
    
    func clear()
    func clear(section: Int)
}