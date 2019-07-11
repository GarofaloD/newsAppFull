//
//  NewsDetails.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 7/7/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class NewsDetails: UIViewController {

    //Properties
    var article = ArticleDetail()
    
    
    //MARK:- Outlets
    @IBOutlet weak var articleImage: NewsImage!
    @IBOutlet weak var articleSource: UILabel!
    @IBOutlet weak var articleWriter: UILabel!
    @IBOutlet weak var articleHeadline: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureArticleView(withArticle: article)
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: articleContent.bottomAnchor).isActive = true
        
        
        
    }
    

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
