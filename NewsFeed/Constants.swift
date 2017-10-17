//
//  Constants.swift
//  NewsFeed
//
//  Created by Catalfamo, Matt on 10/6/17.
//  Copyright © 2017 Catalfamo, Matt. All rights reserved.
//

import Foundation

struct NewsFeedConstants {
    static let newsFeedCell = "newsFeedCell"
}

struct Segues {
    static let newsFeed_article = "newsFeed_article"
}

struct NewsAPI {
    #if DEVELOPMENT
    static let serverUrl = "https://service.us.apiconnect.ibmcloud.com/gws/apigateway/api/c54e916eaadb10eec759379ff2a164de78db5b50db09f8bc2af2c9a2f54f563d/api/news"
    static let apiToken = "ce84ede1-a329-4e48-8ef2-61c75f09d620"
    #else
    static let serverUrl = "http://prod.server.com/api/"
    static let apiToken = ""
    #endif
}

struct Notifications {
    static let newsReceived = Notification.Name(rawValue: "newReceived")
    static let newsReceivedError = Notification.Name(rawValue: "newReceivedError")
    static let newsDecodeError = Notification.Name(rawValue: "newDecodeError")
}

struct ArticleConstants {
    static let articles = "articles"
}
