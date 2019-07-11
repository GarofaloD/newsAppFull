//
//  ArticleDetailView.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 7/8/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class ArticleDetailView: UIView {
    
    //Propoerties
    static let instance = ArticleDetailView()
    let empty = ""
    
    
    //MARK:- Outlets
    @IBOutlet weak var articleContent : UILabel!
    @IBOutlet weak var articleHeadline : UILabel!
    @IBOutlet weak var articleSource : UILabel!
    @IBOutlet weak var articleWriter : UILabel!
    @IBOutlet weak var articleImage = NewsImage()
    
    
    
    //MARK:- Init function
    
    func configureArticleView(withArticle article : ArticleDetail ) {
        
        if let imageToDisplay = article.urlToImage {
            self.articleImage?.loadImage(from: imageToDisplay)
        } else {
            return
        }
        
        guard let source = article.source?.name else { return }
        guard let writer = article.author else { return }
        guard let headline = article.title else { return }
        guard let content = article.content else { return }
        
        articleSource.text = source
        articleHeadline.text = headline
        articleWriter.text = writer
        articleContent.text = content
    }
}
