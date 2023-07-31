//
//  SearchTableViewCell.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLbl: UILabel!
    @IBOutlet weak var teamImageView: CustomImageview!
    
    var animalList : AnimalData? {
        didSet {
           setUpDataForCell()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViews()
    }

    func setUpViews(){
        teamImageView.layer.cornerRadius = teamImageView.frame.width / 2
    }
    
    func setUpDataForCell() {
        if let teamName = animalList?.name {
            teamLbl.text = teamName
        }
        if let teamLogo = animalList?.image{
            if let url = URL(string: teamLogo){
                teamImageView.loadImage(url: url)
            }
        }
    }
}
