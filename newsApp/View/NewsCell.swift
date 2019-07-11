//
//  NewsCell.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 6/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    //var imageToLoad = NewsImage()
    
    
    
    @IBOutlet weak var newsImage = NewsImage()
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var writerLbl: UILabel!
    @IBOutlet weak var headlineLbl: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(article: ArticleDetail){
        
        if let imageToDisplay = article.urlToImage {
            self.newsImage?.loadImage(from: imageToDisplay)
        } else {
            return
        }
        
//        var imageStringToLoad = ""
//
        //guard let image = article.urlToImage else { return }
        guard let source = article.source?.name else { return }
        guard let writer = article.author else { return }
        guard let headline = article.title else { return }
        
        
//        if let urlForImage = URL(string: image) {
//            do {
//                let content = try String(contentsOf: urlForImage)
//                imageStringToLoad = content
//                print(content)
//            } catch {
//                //print()
//            }
//        } else {
//            return
//        }
        
        
        //newsImage?.image = UIImage(named: image)
        sourceLbl.text = source
        writerLbl.text = writer
        headlineLbl.text = headline
        
        
    
    }
    
    
    
    
    
    
    
    
    
    
    
}
