//
//  FlatArrayDataManager.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import Foundation

/**
 *   Implementation of the DataManager abstraction, that manages a single section data structure, as an array
 */

final class FlatArrayDataManager<T>: DataManager {
    private var data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
    convenience init() {
        self.init(data: [T]())
    }
    
    func itemCount() -> Int {
        return data.count
    }
    
    func itemCount(section: Int) -> Int? {
        guard section < 1 else {
            return nil
        }
        
        return itemCount()
    }
    
    func item(indexPath: NSIndexPath) -> T {
        return data[indexPath.row]
    }
    
    func append(newData: [T], toSection: Int) {
        data.appendContentsOf(newData)
    }
    
    func update(item: T, indexPath: NSIndexPath) {
        let index = indexPath.row
        guard index < data.count else {
            return
        }
        
        data[index] = item
    }
    
    func clear() {
        data.removeAll(keepCapacity: false)
    }
    
    func clear(section: Int) {
        clear()
    }
    
    func sectionCount() -> Int {
        return 1
    }    
}