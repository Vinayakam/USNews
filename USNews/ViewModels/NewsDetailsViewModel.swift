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
    
    // Likes and comments api is not working right now.
    // We should fetch the likes and comments and append that values to below variables.
    var likes: Int? = 3
    var comments: [String]? = ["Likes and comments api is not working right now. So, I've added the dummy data for for likes and comments", "Likes and comments api is not working right now. So, I've added the dummy data for for likes and comments"]
    
    let urlPrefix = "https://cn-news-info-api.herokuapp.com"
    init(newsItem: NewsArticle) {
        self.newsItem = newsItem
    }
    
    
    func fetchLikes() async {
        let urlSuffix = getHyphenatedUrlString(urlString: newsItem.url)
        let urlString = "\(urlPrefix)/likes/\(urlSuffix)"
        let apiService = APIService()
        if let likes: Int = try? await apiService.getJson(urlString: urlString) {
            self.likes = likes
        }
    }
    
    private func getHyphenatedUrlString(urlString: String?) -> String {
        guard let urlString else {
            return ""
        }
        
        var resultString = urlString
        resultString.replace("https://", with: "")
        resultString.replace("/", with: "-")
        
        return resultString
    }
}
