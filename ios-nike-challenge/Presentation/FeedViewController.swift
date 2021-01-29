//
//  FeedViewController.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
