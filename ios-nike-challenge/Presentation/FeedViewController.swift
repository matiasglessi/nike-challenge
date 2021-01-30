//
//  FeedViewController.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let viewModel: FeedViewModel
    private let tableView = UITableView()
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getAlbums { _ in
         
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
