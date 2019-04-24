//
//  BlueViewController.swift
//  TestNavigationWithSearchController
//
//  Created by Kevin Lu on 4/24/19.
//  Copyright © 2019 Kevin Lu. All rights reserved.
//

import UIKit
class BlueViewController:UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating{
    
    
    var filteredNumberArray:[Int] = []
    var numberArray:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    let titleLabel = UILabel()
    let tableView = UITableView()
    let searchController:UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.inputAssistantItem.leadingBarButtonGroups = []
        controller.searchBar.inputAssistantItem.trailingBarButtonGroups = []
        return controller
    }()
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        setupView()
    
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .blue
        titleLabel.text = "Blue Label"
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = searchController.searchBar
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredNumberArray.count
        }
        
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if isFiltering() {
            cell.textLabel?.text = "Row Number:\(filteredNumberArray[indexPath.item])"
        } else {
            cell.textLabel?.text = "Row Number:\(numberArray[indexPath.item])"
        }
        
        return cell
    }
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredNumberArray = numberArray.filter({( number : Int) -> Bool in
            return "\(number)".contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
