//
//  UIImageView+Extension.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation
import UIKit

class CustomImageview: UIImageView {
    var task : URLSessionDataTask!
    var imageCache = NSCache<AnyObject,AnyObject>()
    func loadImage(url: URL){
        // set image to nil to overcome interchangebility
        image = nil
        
        //Check another task is running and cancel if running
        if let task = task{
            task.cancel()
        }
        
        //Check image is present in cache
        if let imageCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageCache
            return
        }
        task = URLSession.shared.dataTask(with: url) {[weak self] data, _, _ in
            guard let data = data, let newImage = UIImage(data: data) else {
                return
            }
            self?.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self?.image = newImage
            }
        }
        task.resume()
    }
    
    /* load image with operation queue*/
    func loadImgWithOperation(url:String, indexPath: IndexPath?){
        ImageDownloadManager.shared.downloadImage(imgUrl: url, indexPath: indexPath) {[weak self] image, _, error  in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    /* load image with operation queue with low priority*/
    func loadImgWithLowPriorityOperation(url:String, indexPath: IndexPath?){
        ImageDownloadManager.shared.downloadImageWithLowPriority(imgUrl: url, indexPath: indexPath)
    }
}
