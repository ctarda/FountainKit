//
//  ViewController.swift
//  FountainKitDemo
//
//  Created by Cesar Tardaguila on 12/3/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit
import FountainKit

class ViewController: UITableViewController {
    private var dataSource: TableViewDataSource<FlatArrayDataManager<Movie>, DemoTableViewCell>?
    private var dataManager: FlatArrayDataManager<Movie>?

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    private func initData() {
        let data = [ Movie(title: "The Quiet Man", director: "John Ford"),
                    Movie(title: "The Third Man", director: "Carol Reed") ]
        
        dataManager = FlatArrayDataManager(data: data)
        
        dataSource = TableViewDataSource(dataManager: dataManager!, cellType: DemoTableViewCell.self)
        tableView.registerClass(DemoTableViewCell.self, forCellReuseIdentifier: DemoTableViewCell.cellReuseIdentifier())
        tableView.dataSource = dataSource        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

}

