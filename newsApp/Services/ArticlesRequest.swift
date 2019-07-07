//
//  ArticlesRequest.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 6/20/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import Foundation

enum ArticleError : Error {
    
    case noDataAvailable
    case CanNotProcessdata
    
}
    
struct RequestTopHeadlines {
    
    //MARK:- Properties
    var topHeadlinesUrl : URL

    //MARK:- Initializers
    init() {
        
        // https://newsapi.org/v2/top-headlines?country=us&apiKey=154a8c80de224a3e8fb5b3465bea89f0
        
        let resourceString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=154a8c80de224a3e8fb5b3465bea89f0"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.topHeadlinesUrl = resourceURL
    }
    
    func getArticles(completion: @escaping(Result<[ArticleDetail], ArticleError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: topHeadlinesUrl) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let articleResponse = try decoder.decode(Articles.self, from: jsonData)
                //print(articleResponse)
                let articleDetails = articleResponse.articles
                //print(articleDetails)
                completion(.success(articleDetails))
            } catch {
                completion(.failure(.CanNotProcessdata))
            }
        }
        dataTask.resume()
        
    }
}


//To be added later
struct RequestByCategory {
}

struct RequestByTerm {
}


