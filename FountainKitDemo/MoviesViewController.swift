//
//  ViewController.swift
//  FountainKitDemo
//
//  Created by Cesar Tardaguila on 12/3/2016.
//

import UIKit
import FountainKit

class MoviesViewController: UITableViewController {
    
    fileprivate var dataSource: TableViewDataSource<FlatArrayDataManager<Movie>, MovieCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initTableView()
    }

    fileprivate func initData() {
        let data = [ Movie(title: "The Quiet Man", director: "John Ford"),
                    Movie(title: "The Third Man", director: "Carol Reed") ]
        
        let dataManager = FlatArrayDataManager(data: data)
        dataSource = TableViewDataSource(dataManager: dataManager, cellType: MovieCell.self)
    }
    
    fileprivate func initTableView() {
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellReuseIdentifier())
        tableView.dataSource = dataSource
    }
}

