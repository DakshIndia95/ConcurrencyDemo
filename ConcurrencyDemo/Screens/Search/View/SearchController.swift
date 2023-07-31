//
//  SecondTabController.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

class SearchController : UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchListTableView: UITableView!
    @IBOutlet weak var noItemDemo: UILabel!
    
    lazy var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        getTeamsListFromJson()
    }
    
    func setUpTableView() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        searchListTableView.register(nib, forCellReuseIdentifier: CellIdentifier.searchCell)
        searchListTableView.delegate = self
        searchListTableView.dataSource = self
    }
    
    //MARK: function for getting team list from json
    func getTeamsListFromJson() {
        viewModel.delegate = self
        viewModel.getTeamsData()
    }
}

extension SearchController : SearchServices {
    func reloadData() {
        searchListTableView.reloadData()
    }
}
extension SearchController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath)
    }
}
