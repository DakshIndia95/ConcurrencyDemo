//
//  SearchTableViewCell.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLbl: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    
    var teamList : TeamsModel? {
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
        if let teamName = teamList?.name {
            teamLbl.text = teamName
        }
        if let teamLogo = teamList?.teamLogo{
            teamImageView.image = UIImage(named: teamLogo)
        }
    }
}
