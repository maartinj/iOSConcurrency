//
//  PostsListView.swift
//  iOSConcurrency
//
//  Created by Marcin Jędrzejak on 10/11/2022.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var vm = PostsListViewModel(forPreview: true)
    var userId: Int?
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .overlay(
            Group {
                if vm.isLoading {
                    ProgressView()
                }
            }
        )
        .alert(isPresented: $vm.showAlert, content: {
            Alert(title: Text("Application Error"), message: Text(vm.errorMessage ?? ""))
        })
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        .onAppear {
            Task {
                vm.userId = userId
                await vm.fetchPosts()
            }
        }
        // 16:55
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsListView(userId: 1)
        }
    }
}
