//
//  News.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import Foundation

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

struct NewsArticle: Codable, Identifiable {
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    
    var id: String {
        UUID().uuidString
    }
}
