//
//  FlatArrayDataManager.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//

/**
 *   Implementation of the DataManager protocol, that manages a single section data structure, backed up by an array
 */

public final class FlatArrayDataManager<T>: DataManager {
    private var data: [T]
    
    public init(data: [T]) {
        self.data = data
    }
    
    public convenience init() {
        self.init(data: [T]())
    }
    
    public func itemCount() -> Int {
        return data.count
    }
    
    public func itemCount(_ section: Int) -> Int? {
        guard section < 1 else {
            return nil
        }
        
        return itemCount()
    }
    
    public func item(_ indexPath: IndexPath) -> T {
        return data[(indexPath as NSIndexPath).row]
    }
    
    public func append(_ newData: [T], toSection: Int) {
        data.append(contentsOf: newData)
    }
    
    public func update(_ item: T, indexPath: IndexPath) {
        let index = (indexPath as NSIndexPath).row
        guard index < data.count else {
            return
        }
        
        data[index] = item
    }
    
    public func clear() {
        data.removeAll(keepingCapacity: false)
    }
    
    public func clear(_ section: Int) {
        clear()
    }
    
    public func sectionCount() -> Int {
        return 1
    }
}
