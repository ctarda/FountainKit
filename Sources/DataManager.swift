//
//  DataManager.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//

/**
    Abstracts a strongly-typed data collection.
*/
public protocol DataManager {
    associatedtype DataType
    
    /**
        Total number of items in the data collection
    */
    func itemCount() -> Int
    
    /**
        Number of items in a given section
        
        - parameter section: the section index
    */
    func itemCount(_ section: Int) -> Int?
    
    /**
        Number of sections
    */
    func sectionCount() -> Int
    
    /**
        Item at a given indexpath
    */
    func item(_ indexPath: IndexPath) -> DataType
    
    /**
        Append new data to a given section
     
        - parameter newData: an array of new items
        - parameter toSection: the sections those items will be added to
    */
    func append(_ newData: [DataType], toSection: Int)
    
    /**
        Update an item at a given indexpath
    */
    func update(_ item: DataType, indexPath: IndexPath)
    
    /**
        Remove all the content of the underlying collection
    */
    func clear()
    
    /**
        Remove all items in a given section
     
        - parameter section: The section index
    */
    func clear(_ section: Int)
}
