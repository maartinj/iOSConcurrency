//
//  UserAndPosts.swift
//  iOSConcurrency
//
//  Created by Marcin Jędrzejak on 01/12/2022.
//

import Foundation

struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
