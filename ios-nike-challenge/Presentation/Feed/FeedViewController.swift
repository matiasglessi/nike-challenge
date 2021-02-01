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
    
    private var albums = [Album]()
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = "Top 100 Albums (All Genres)"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "AlbumsTableViewCell")

        viewModel.getAlbums { [weak self] albums in
            guard let strongSelf = self else { return }
            strongSelf.albums = albums
            strongSelf.updateTableView()
        }
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
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

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsTableViewCell", for: indexPath) as! AlbumsTableViewCell
        cell.album = albums[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.albumSelected(album: albums[indexPath.row])
    }
}
