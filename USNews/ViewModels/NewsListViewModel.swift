//
//  NewsListViewModel.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import Foundation
import SwiftUI

@Observable
class NewsListViewModel {
    private(set) var news: [NewsArticle] = []
    var isLoading = false
    var showError = false
    var errorMessage = ""
    
    private let country = "us"
    private let apiKey = "b8973546d8494aa9b5c4fec73de35cd1"
    
    
    func fetchNews() async {
        isLoading = true
        defer {
            isLoading = false
        }
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)"
        let apiService = APIService()
        do {
            let newsResponse: News = try await apiService.getJson(urlString: urlString)
            self.news = newsResponse.articles
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
}
