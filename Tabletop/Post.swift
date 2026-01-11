//
//  Posts.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/28/25.
//

import SwiftUI

struct Post: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case profilePhotoName
        case username
        case postImageName
        case numLikes
        case numComments
        case caption
    }
    
    var id = UUID()
    var profilePhotoName: String
    var username: String
    var postImageName: String
    var numLikes: Int
    var numComments: Int
    var caption: String
}

class JsonDataReader: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            print("json file not found")
            return
        }
        
        let data = try? Data(contentsOf:url)
        let posts = try? JSONDecoder().decode([Post].self, from: data!)
        
        self.posts = posts!
    }
}
