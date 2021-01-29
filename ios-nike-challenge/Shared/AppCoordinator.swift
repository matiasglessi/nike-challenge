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
        let feedViewModel = FeedViewModel()
        let feedViewController = FeedViewController(viewModel: feedViewModel)
        navigationController.pushViewController(feedViewController, animated: true)
    }
}
