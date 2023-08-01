//
//  HomeViewModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 01/08/23.
//

import Foundation
import UIKit

struct HomeViewModel {
    var imageSet = ["https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/bear.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/cat.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gir.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/leo.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/pnd.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/gor.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/shrk.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/koa.jpg","https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg"]
    
}

extension HomeViewModel {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.homeCell, for: indexPath) as! HomeCollectionViewCell
        cell.loadImageView(url: imageSet[indexPath.row])
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let cell = cell as? HomeCollectionViewCell else {
//            return
//        }
//        cell.animalImg.loadImgWithOperation(url: imageSet[indexPath.row], indexPath: indexPath)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let cell = cell as? HomeCollectionViewCell else {
//            return
//        }
//        cell.animalImg.loadImgWithLowPriorityOperation(url: imageSet[indexPath.row], indexPath: indexPath)
//    }
}
