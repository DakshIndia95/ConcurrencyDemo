//
//  ProfileTableViewCell.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLbl: UILabel!
    
    var userList : UserModel? {
        didSet {
            setUpDataForCell()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpDataForCell() {
        if let name = userList?.name {
            userNameLbl.text = name
        }
    }
}
