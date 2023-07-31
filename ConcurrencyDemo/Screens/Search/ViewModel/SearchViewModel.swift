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
    func showError()
}

class SearchViewModel {
    var animalModel : AnimalModel? {
        didSet {
            delegate?.reloadData()
        }
    }
    var dispatchWorkItem: DispatchWorkItem?
    weak var delegate : SearchServices?
    private let apiHandler = ApiHandler()
    
    func getAnimalsData(animal:String){
        dispatchWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.apiHandler.fetchDataWithoutAsync(url: AppUrl.animalURL+animal, type: AnimalModel.self) {[weak self] result in
                switch result {
                    case .success(let animalArray):
                        self?.animalModel = animalArray
                    case .failure(_):
                        self?.delegate?.showError()
                }
            }
        }

        dispatchWorkItem = requestWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(500), execute: requestWorkItem)
    }
}

extension SearchViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalModel?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.searchCell, for: indexPath) as! SearchTableViewCell
        if let data = animalModel?.data {
            cell.animalList = data[safe: indexPath.row]
        }
        return cell
    }
}
