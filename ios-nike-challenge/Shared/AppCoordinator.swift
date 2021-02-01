//
//  AppCoordinator.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        
        let apiClient = URLSessionAPIClient.init(mapper: AlbumMapper())
        
        let feedViewModel = FeedViewModel(albumService: DefaultAlbumService(apiClient: apiClient))
        feedViewModel.albumSelectedAction = { [weak self] album in
            guard let strongSelf = self else { return }
            strongSelf.goToDetailScreen(with: album)
        }
        
        let feedViewController = FeedViewController(viewModel: feedViewModel)
        navigationController.pushViewController(feedViewController, animated: true)
    }
    
    private func goToDetailScreen(with album: Album) {
        let apiClient = URLSessionAPIClient.init(mapper: AlbumMapper())

        let detailViewModel = DetailViewModel(getAlbumArt: DefaultGetAlbumArtService(apiClient: apiClient), album: album)
        
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        detailViewController.modalPresentationStyle = .overCurrentContext
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}
