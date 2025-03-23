//
//  NewsListRowView.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import SwiftUI

struct NewsListRowView: View {
    let newsItem: NewsArticle
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: newsItem.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "newspaper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 140, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 24))
                
            VStack(alignment: .leading, spacing: 8) {
                Text(newsItem.title)
                    .lineLimit(3)
                    .font(.headline)
                if let author = newsItem.author {
                    Text(author)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    NewsListRowView(newsItem: MockNews.newsItem)
}
