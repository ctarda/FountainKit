//
//  DemoTableViewCell.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 12/3/2016.
//

import UIKit
import FountainKit

final class MovieCell: UITableViewCell, DataSettable {
    var data: Movie? {
        didSet {
            textLabel?.text = data?.title
            detailTextLabel?.text = data?.director
        }
    }
}