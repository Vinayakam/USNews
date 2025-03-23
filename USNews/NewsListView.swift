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
        Text("Hello, World!")
            .task {
                await viewModel.fetchNews()
            }
    }
}

#Preview {
    NewsListView()
}
