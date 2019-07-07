//
//  NewsImage.swift
//  newsApp
// A new class to assign to the image that will be loaded on the newscell. This is done on a async way
//
//  Created by Daniel  Garofalo on 6/26/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit


class NewsImage : UIImageView {
    
    func loadImage(from url : URL){

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data, let newImage = UIImage(data: data)
                else {
                    print("Could not load Image from \(url)")
                    return
            }
            
            DispatchQueue.main.async {
                self.image = newImage
            }
            
        }
        task.resume()
        
    }
    
    
    
    
    
}
