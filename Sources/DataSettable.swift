//
//  DataSettable.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//

/**
    This protocol should be implemented by table view and collection view cells.
*/
public protocol DataSettable {
    typealias DataType
    var data: DataType? {get set}
}

/**
    Cells implementing the DataSettable protocol would also implement cellReuseIdentifier
*/
extension DataSettable {
    /**
        Returns the cell name as string, so the cell can be registered with table or collection views.
    */
    public static func cellReuseIdentifier() -> String {
        return String(self)
    }
}