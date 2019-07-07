//
//  News.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 6/20/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import Foundation

//struct NewsApiResponse : Decodable {
//
//    var status : String
//    var totalResults : Int
//    var articles : [ArticleDetail]
//
//}


struct Articles : Decodable {
    
    var articles : [ArticleDetail]
    
}

struct ArticleDetail : Decodable {
    
    var source : SourceInfo?
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : URL?      //////////
    var publishedAt : String?
    var content : String?
    
}


struct SourceInfo : Decodable  {
    
    var id : String?
    var name : String?
    
}
