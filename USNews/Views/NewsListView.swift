//
//  NewsListView.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import SwiftUI

struct NewsListView: View {
    @State private var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.news.isEmpty && !viewModel.errorMessage.isEmpty {
                    ContentUnavailableView("No latest news to show", systemImage: "xmark.app")
                        .foregroundStyle(.secondary)
                } else {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else {
                        List(viewModel.news) { newsItem in
                            NavigationLink {
                                //
                            } label: {
                                NewsListRowView(newsItem: newsItem)
                            }

                        }
                        .listStyle(.grouped)
                    }
                }
            }
            .alert("Application Error",
                   isPresented: $viewModel.showError,
                   actions: { Button("Ok") {} },
                   message: {
                Text(viewModel.errorMessage)
            })
            .navigationTitle("Latest News")
        }
        .task {
            await viewModel.fetchNews()
        }
    }
}

#Preview {
    NewsListView()
}
