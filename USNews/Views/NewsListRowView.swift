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
                    Text(newsItem.author ?? "")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    NewsListRowView(newsItem: NewsArticle(author: "https://www.facebook.com/bbcnews", title: "Sunday with Laura Kuenssberg: Chancellor Rachel Reeves confirms plan to cut Civil Service running costs by 15% - BBC.com", description: "The chancellor says she is committed to cutting the costs of running government ahead of this week's Spring Statement.", url: "https://www.bbc.com/news/live/c3d8385k2xet", urlToImage: "https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/ef4e/live/2139f0d0-07d1-11f0-88b7-5556e7b55c5e.jpg", content: ""))
}
