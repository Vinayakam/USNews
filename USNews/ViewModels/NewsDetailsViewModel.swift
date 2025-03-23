//
//  NewsDetailsViewModel.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import Foundation

@Observable
class NewsDetailsViewModel {
    let newsItem: NewsArticle
    
    init(newsItem: NewsArticle) {
        self.newsItem = newsItem
    }
}
