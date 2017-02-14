//
//  Extensions.swift
//  manny chat
//
//  Created by Emmanuel Erilibe on 2/13/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageusingCacheWithUrlString(_ urlString: String) {
        
        self.image = nil // orUIImage(named: "gameofthrones_steel")
        
        //Check cache for image
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = cachedImage
            return
        }
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //download hit error so lets return out
            if error != nil {
                print(error as! NSError)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                }
            }
        }.resume()
    }
}
