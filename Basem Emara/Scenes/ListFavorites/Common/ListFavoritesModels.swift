//
//  ListFavoritesModels.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-06.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress

enum ListFavoritesModels {
    
    struct FetchPostsRequest {
        
    }
    
    struct FavoriteRequest {
        let postID: Int
    }
    
    struct FetchPostsResponse {
        let posts: [PostType]
        let media: [MediaType]
    }
    
    struct FavoriteResponse {
        let postID: Int
        let favorite: Bool
    }
    
    struct FavoriteViewModel {
        let postID: Int
        let favorite: Bool
    }
}
