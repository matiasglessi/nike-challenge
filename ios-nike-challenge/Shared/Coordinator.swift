//
//  Coordinator.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
