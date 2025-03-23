//
//  NewsListView.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import SwiftUI

struct NewsListView: View {
    let viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.news) { newsItem in
                NewsListRowView(newsItem: newsItem)
            }
            .navigationTitle("Latest News")
            .listStyle(.grouped)
        }
        .task {
            await viewModel.fetchNews()
        }
    }
}

#Preview {
    NewsListView()
}
