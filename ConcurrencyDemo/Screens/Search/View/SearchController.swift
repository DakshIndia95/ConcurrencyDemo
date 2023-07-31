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
    @IBOutlet weak var noItemLbl: UILabel!
    
    lazy var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        searchBar.delegate = self
    }
    
    func setUpTableView() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        searchListTableView.register(nib, forCellReuseIdentifier: CellIdentifier.searchCell)
        searchListTableView.delegate = self
        searchListTableView.dataSource = self
        viewModel.delegate = self
    }
}

extension SearchController : SearchServices {
    func showError() {
        DispatchQueue.main.async { [weak self] in
            self?.searchListTableView.isHidden = true
        }
    }
    func reloadData() {
        searchListTableView.reloadData()
    }
}
