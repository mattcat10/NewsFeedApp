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
    static let SERVER_URL = "http://dev.server.com/api/"
    static let API_TOKEN = ""
    #else
    static let SERVER_URL = "http://prod.server.com/api/"
    static let API_TOKEN = ""
    #endif
}
