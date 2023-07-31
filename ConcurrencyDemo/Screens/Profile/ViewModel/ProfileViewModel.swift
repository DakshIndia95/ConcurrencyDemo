//
//  ProfileViewModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

protocol ProfileServices: NSObject {
    func reloadData()
    func showError(error: Error)
}

class ProfileViewModel {
    
    var userModel : [UserModel] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    weak var delegate : ProfileServices?
    lazy var apiHandler = ApiHandler()
    
    //MARK: fetch user's data with async await
    @MainActor func fetchUserUsingAsync(){
        Task {
            do {
                let userResponseArray : [UserModel] = try await apiHandler.fetchUserUsingAsync(url: AppUrl.userUrl)
                userModel = userResponseArray
            }catch{
                delegate?.showError(error: error)
                print("Error: \(error)")
            }
        }
    }
}

extension ProfileViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.profileCell, for: indexPath) as! ProfileTableViewCell
        cell.userList = userModel[safe: indexPath.row]
        return cell
    }
}
