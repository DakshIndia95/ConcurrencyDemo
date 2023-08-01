//
//  HomeCollectionViewCell.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var animalImg: CustomImageview!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadImageView(url:String){
        animalImg.loadImgWithOperation(url: url)
    }
    func loadImageWithLowPriority(url:String){
        animalImg.loadImgWithLowPriorityOperation(url: url)
    }
}
