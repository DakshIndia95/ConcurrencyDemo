//
//  SearchViewModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

protocol SearchServices: AnyObject {
    func reloadData()
}

struct SearchViewModel {
    var teamData : [TeamsModel] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    weak var delegate : SearchServices?
    private let jsonHelper = JSONHelper()
    
    mutating func getTeamsData(){
        if let teamsResponseArray = jsonHelper.loadJsonDataFromFile() {
            teamData = teamsResponseArray
        }
    }
}

extension SearchViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.searchCell, for: indexPath) as! SearchTableViewCell
        cell.teamList = teamData[safe: indexPath.row]
        return cell
    }
}
