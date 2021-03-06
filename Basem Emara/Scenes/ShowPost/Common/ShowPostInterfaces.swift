//
//  ShowPostInterfaces.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-02.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress

protocol ShowPostBusinessLogic {
    func fetchPost(with request: ShowPostModels.Request)
    func fetchByURL(with request: ShowPostModels.FetchWebRequest)
    func toggleFavorite(with request: ShowPostModels.FavoriteRequest)
}

protocol ShowPostPresentable {
    func presentPost(for response: ShowPostModels.Response)
    func presentPost(error: DataError)
    
    func presentByURL(for response: ShowPostModels.FetchWebResponse)
    
    func presentToggleFavorite(for response: ShowPostModels.FavoriteResponse)
}

protocol ShowPostDisplayable: class, AppDisplayable {
    func displayPost(with viewModel: ShowPostModels.ViewModel)
    func displayByURL(with viewModel: ShowPostModels.WebViewModel)
    func display(isFavorite: Bool)
}

protocol ShowPostRoutable: AppRoutable {
    func listPosts(for fetchType: ListPostsViewController.FetchType)
}

/// Delegate for target controller to pass data back
protocol ShowPostViewControllerDelegate: class {
    func update(postID: Int)
}
