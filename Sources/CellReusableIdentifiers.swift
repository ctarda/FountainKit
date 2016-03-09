//
//  CellReusableIdentifiers.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//
import UIKit

public extension UITableViewCell {
  public static func cellReuseIdentifier() -> String {
    return String(self)
  }
}
