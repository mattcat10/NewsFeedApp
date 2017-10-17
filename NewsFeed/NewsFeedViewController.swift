//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Catalfamo, Matt on 10/6/17.
//  Copyright © 2017 Catalfamo, Matt. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var ui_newsFeedCollectionView: UICollectionView!
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui_newsFeedCollectionView.delegate = self
        ui_newsFeedCollectionView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNewsReceived(_:)), name: Notifications.newsReceived, object: nil)

        let api = ArticleAPI()
        api.fetchArticles()
    }

    @objc func handleNewsReceived(_ notification: Notification) {
        guard let tempArticles = notification.userInfo?[ArticleConstants.articles] as? [Article]
            else {
                return
        }

        self.articles = tempArticles
        self.ui_newsFeedCollectionView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension NewsFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedConstants.newsFeedCell, for: indexPath) as! NewsFeedCollectionViewCell
        cell.heading.text = self.articles[indexPath.item].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Segues.newsFeed_article, sender: self)
    }
    
}

