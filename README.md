[![Build Status](https://travis-ci.org/ctarda/FountainKit.svg?branch=master)](https://travis-ci.org/ctarda/FountainKit)

# FountainKit
![FountainKit](http://ctarda.com/wp-content/uploads/2016/03/FullSizeRender-2.jpg)

FountainKit is a lightweight Swift framework that attempts to decrease coupling between view controllers and datasources, and make data sources and cells easier to unit test.

## The problem FountainKit tries to solve
Keeping view controllers small and focused is hard. View controllers, in particular those that need to present data, tend to do too much, to have too many responsibilites.

That makes those view controllers rigid, difficult to change, and dificult to unit test.

## The way FountainKit tries to solve the problem
FountainKit is a lightweight framework that suggests a way to decouple datasources from view controllers, in a way that the datasources, the table view or collection view cells, and the view controllers can colaborate with each other and remain decoupled and testable.

### Cells
Cells should be responsible for rendering their own content. In order to enforce that, table view and collection view cells must implement the DataSettable protocol:

```swift
public protocol DataSettable {
    typealias DataType
    var data: DataType? {get set}
}
```
DataType is the model object that will be provided to the cell.

### View Controller
A view controller should only be responsible for creating a data source, providing it the necessary data and a cell type, and then set it as the dataSource of the tableview / collectionview it controls.

```swift
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
```

## Integrating FountainKit in your project
FountainKit can be integrated using:
### Carthage
```ruby
github "ctarda/FountainKit"
```
### CocoaPods
```ruby
use frameworks!
pod 'FountainKit'
```
### Swift Package Manager
If you use the Swift Package Manager, add FountainKit to the dependencies of your Package.swift file:

```ruby
import PackageDescription

let package = Package(
    //
    dependencies: [
        //
        .Package(url: "https://github.com/ctarda/FountainKit.git", majorVersion: 1, minor: 0)
    ]
)
```
## Examples
This repository contains a sample app implementing a table view.

If you are interested in the rationale behind this framework, read this blog post: [http://ctarda.com/2016/03/introducing-fountainkit/](http://ctarda.com/2016/03/introducing-fountainkit/) 

## Contributing to FountainKit
Contributions of any kind (bug reports, feature suggestions, new features) are more than welcome, and greatly appreciated.

In particular, it would be necessary to:

- Add more implementations of the DataManager protocol, managing diferent data structures.
- Expand to delegates!
- Improve the current sample application, adding a sample integration of a collectionview.
- Add some more documentation.

## License
FountainKit is released under the MIT license
