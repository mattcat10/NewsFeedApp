//
//  ArticleRepository.swift
//  NewsFeed
//
//  Created by Catalfamo, Matt on 10/10/17.
//  Copyright © 2017 Catalfamo, Matt. All rights reserved.
//

import Foundation

class ArticleAPI {
    
    func fetchArticles() {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: NewsAPI.serverUrl)
        var urlRequest: URLRequest = URLRequest(url: url!)
        urlRequest.setValue(NewsAPI.apiToken, forHTTPHeaderField: "X-IBM-Client-ID")
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error != nil {
                NotificationCenter.default.post(name: Notifications.newsReceivedError, object: nil)
                return
            }
            
            var articles: [Article] = []
            
            if let rawData = data {
                articles = self.decodeArticle(data: rawData)
            }
            
            let userInfo = [ArticleConstants.articles: articles]
            NotificationCenter.default.post(name: Notifications.newsReceived, object: nil, userInfo: userInfo)
        })
            
        task.resume()
    }
    
    private func decodeArticle(data: Data) -> [Article] {
        let decoder = JSONDecoder()
        var articles: [Article] = []
        do {
            let articleResponse = try decoder.decode(ArticleResponse.self, from: data)
            articles = articleResponse.articles
        } catch {
            NotificationCenter.default.post(name: Notifications.newsDecodeError, object: nil)
        }
        return articles
    }
}
