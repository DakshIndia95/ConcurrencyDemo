//
//  ThirdTabController.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

class ProfileController : UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var noUserLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        fetchUsersFromViewModel()
    }
    
    func setUpTableView() {
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: CellIdentifier.profileCell)
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    func fetchUsersFromViewModel(){
        activityIndicator.startAnimating()
        profileViewModel.delegate = self
        profileViewModel.fetchUserUsingAsync()
    }
}

extension ProfileController: ProfileServices{
    func reloadData() {
        activityIndicator.isHidden = true
        userTableView.reloadData()
    }
    
    func showError(error: Error) {
        activityIndicator.isHidden = true
        userTableView.isHidden = true
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return profileViewModel.tableView(tableView, cellForRowAt: indexPath)
    }
}
