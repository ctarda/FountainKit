//
//  ViewController.swift
//  FountainKitDemo
//
//  Created by Cesar Tardaguila on 12/3/2016.
//

import UIKit
import FountainKit

class MoviesViewController: UITableViewController {
    
    private var dataSource: TableViewDataSource<FlatArrayDataManager<Movie>, MovieCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initTableView()
    }

    private func initData() {
        let data = [ Movie(title: "The Quiet Man", director: "John Ford"),
                    Movie(title: "The Third Man", director: "Carol Reed") ]
        
        let dataManager = FlatArrayDataManager(data: data)
        dataSource = TableViewDataSource(dataManager: dataManager, cellType: MovieCell.self)
    }
    
    private func initTableView() {
        tableView.registerClass(MovieCell.self, forCellReuseIdentifier: MovieCell.cellReuseIdentifier())
        tableView.dataSource = dataSource
    }
}

