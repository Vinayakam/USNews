//
//  NewsDetailsView.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import SwiftUI

struct NewsDetailsView: View {
    @State var viewModel: NewsDetailsViewModel
    
    init(newsItem: NewsArticle) {
        _viewModel = State(initialValue: NewsDetailsViewModel(newsItem: newsItem))
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NewsDetailsView(newsItem: NewsArticle(author: "https://www.facebook.com/bbcnews", title: "Sunday with Laura Kuenssberg: Chancellor Rachel Reeves confirms plan to cut Civil Service running costs by 15% - BBC.com", description: "The chancellor says she is committed to cutting the costs of running government ahead of this week's Spring Statement.", url: "https://www.bbc.com/news/live/c3d8385k2xet", urlToImage: "https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/ef4e/live/2139f0d0-07d1-11f0-88b7-5556e7b55c5e.jpg", content: ""))
}
