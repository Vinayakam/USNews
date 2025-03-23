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
        ScrollView {
            AsyncImage(url: viewModel.newsItem.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "newspaper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            .frame(maxWidth: .infinity)
                
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.newsItem.title)
                    .font(.headline)
                if let author = viewModel.newsItem.author {
                    Text(author)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                
                if let description = viewModel.newsItem.description {
                    Text(description)
                        .foregroundStyle(.secondary)
                }
                
                if let content = viewModel.newsItem.content {
                    Text(content)
                        .foregroundStyle(.secondary)
                    Divider()
                }
                
                if let likes = viewModel.likes {
                    HStack {
                        Text("Likes:")
                            .bold()
                        Text("\(likes)")
                    }
                    .padding(.vertical)
                }
                
                if let comments = viewModel.comments {
                    Text("Comments:")
                        .bold()
                    ForEach(comments, id: \.self) { comment in
                        Text(comment)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(8)
        }
        .task {
            await viewModel.fetchLikes()
        }
    }
}

#Preview {
    NewsDetailsView(newsItem: MockNews.newsItem)
}
