//
//  HomeViewModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 01/08/23.
//

import Foundation
import UIKit

protocol HomeServices: NSObject {
    func reloadData()
}
struct HomeViewModel {
    weak var delegate: HomeServices?
    var imageSet = ["https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg"]
    
    func reloadCollectionView(){
        delegate?.reloadData()
    }
    
}

extension HomeViewModel {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.homeCell, for: indexPath) as! HomeCollectionViewCell
        //        cell.animalImg.loadImgWithOperation(url: imageSet[indexPath.row], indexPath: indexPath)
        return cell


    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        ImageDownloadManager.shared.downloadImage(imgUrl: imageSet[indexPath.row], indexPath: indexPath) { image, indexPath, error in
            if let newIndexPath = indexPath {
                DispatchQueue.main.async {
                    if let getCell = collectionView.cellForItem(at: newIndexPath) as? HomeCollectionViewCell{
                            getCell.animalImg.image = image
                    }
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        ImageDownloadManager.shared.downloadImageWithLowPriority(imgUrl: imageSet[indexPath.row], indexPath: indexPath)
    }
}
