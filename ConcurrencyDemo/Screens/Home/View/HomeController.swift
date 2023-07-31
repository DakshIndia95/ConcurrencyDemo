//
//  FirstTabController.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

class HomeController : UIViewController {
    
    @IBOutlet weak var homeCollection: UICollectionView!
    @IBOutlet weak var noDataLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollection.register(nib, forCellWithReuseIdentifier: CellIdentifier.homeCell)
        homeCollection.delegate = self
        homeCollection.dataSource = self
        
        homeCollection.reloadData()
    }
}

extension HomeController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.homeCell, for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
