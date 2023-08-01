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
    
    lazy var homeViewModel = HomeViewModel()
    
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
        return homeViewModel.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return homeViewModel.collectionView(collectionView, cellForItemAt: indexPath)
    }
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        homeViewModel.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        homeViewModel.collectionView(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
//    }
    
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
