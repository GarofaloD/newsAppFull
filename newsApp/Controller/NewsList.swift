//  NewsList.swift
//  newsApp
//
//  Created by Daniel  Garofalo on 6/20/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class NewsList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- Properties
    var listOfArticles = [ArticleDetail](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    //MARK:- Outlets
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    
    //MARK:- Load up Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableview Init
        tableView.delegate = self
        tableView.dataSource = self
        
        //Load Articles
        loadTopHeadlines()
    }
    

    
    //MARK:- Table view Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: REUSABLE_NEWS_CELL , for: indexPath) as? NewsCell else {return UITableViewCell()}
        let article = listOfArticles[indexPath.row]
        cell.configureCell(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = listOfArticles[indexPath.row]
        performSegue(withIdentifier: GO_TO_NEWS_DETAILS, sender: selectedArticle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let singleArticlePage = segue.destination as? NewsDetails {
            if let selectedArticle = sender as? ArticleDetail {
                singleArticlePage.article = selectedArticle
            }
        }
    }
    
    
    //MARK:- Custom Functions
    
    func loadTopHeadlines(){
        let newsRequest = RequestTopHeadlines()
        newsRequest.getArticles { [weak self] result in
            switch result {
                case .failure(let error):
                print(error)
                case .success(let articles):
                self?.listOfArticles = articles

            }
        }
    }
    
}
