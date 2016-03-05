//
//  DataSettable.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 5/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

public protocol DataSettable {
    typealias DataType
    var data: DataType? {get set}
}
