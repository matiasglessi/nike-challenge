//
//  DetailViewController.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

class DetailViewController: UIViewController {

    private let viewModel: DetailViewModel
    
    private let albumArtImageView = UIImageView()
    private let containerInfoView = UIView()
    private let iTunesButton = UIButton()
    private let albumTitleLabel = UILabel()
    private let artistNameLabel = UILabel()
    private let genresLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let copyrightInfoLabel = UILabel()


    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.setAlbum()
    }
    
    
    private func setAlbum() {
        let album = viewModel.getAlbum()
        
        viewModel.getAlbumArt(for: album.albumArt) { [weak self] (albumArt) in
            guard let strongSelf = self else { return }
            strongSelf.setAlbumArt(with: albumArt)
        }
        
        albumTitleLabel.text = album.name
        artistNameLabel.text = album.artist
        genresLabel.text = album.genres.joined(separator: ", ")
        releaseDateLabel.text = album.releaseDate
        copyrightInfoLabel.text = album.copyrightInfo
    }
    
    private func setAlbumArt(with image: UIImage?) {
        DispatchQueue.main.async {
            self.albumArtImageView.image = image
        }
    }
    
    @objc func goToiTunesPage(button: UIButton) {
        
        let album = viewModel.getAlbum()
        
        if let url = URL(string: album.itunesLink) {
            UIApplication.shared.open(url)
        }
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        
        albumArtImageView.contentMode = .scaleAspectFill
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.clipsToBounds = true

        
        containerInfoView.translatesAutoresizingMaskIntoConstraints = false
        containerInfoView.clipsToBounds = true
        
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.clipsToBounds = true
        iTunesButton.setTitle("Album page in iTunes", for: .normal)
        iTunesButton.backgroundColor = .blue
        iTunesButton.addTarget(self, action: #selector(goToiTunesPage), for: .touchUpInside)
        
        view.addSubview(albumArtImageView)
        view.addSubview(containerInfoView)
        view.addSubview(iTunesButton)
        
        let safeAreaGuide = self.view.safeAreaLayoutGuide
        
        albumArtImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 20).isActive = true
        albumArtImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        containerInfoView.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 40).isActive = true
        containerInfoView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 10).isActive = true
        containerInfoView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -10).isActive = true
        containerInfoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        iTunesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        iTunesButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -20).isActive = true
        iTunesButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -20).isActive = true
        
        albumTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        albumTitleLabel.numberOfLines = 0
        albumTitleLabel.textColor = .black
        albumTitleLabel.textAlignment = .center
        albumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artistNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        artistNameLabel.numberOfLines = 0
        artistNameLabel.textColor = .black
        artistNameLabel.textAlignment = .center
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        genresLabel.font = UIFont.boldSystemFont(ofSize: 15)
        genresLabel.numberOfLines = 0
        genresLabel.textColor = .darkGray
        genresLabel.textAlignment = .center
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        releaseDateLabel.font = UIFont.boldSystemFont(ofSize: 15)
        releaseDateLabel.numberOfLines = 0
        releaseDateLabel.textColor = .darkGray
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        copyrightInfoLabel.font = UIFont.boldSystemFont(ofSize: 13)
        copyrightInfoLabel.numberOfLines = 0
        copyrightInfoLabel.textColor = .darkGray
        copyrightInfoLabel.textAlignment = .center
        copyrightInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        containerInfoView.addSubview(artistNameLabel)
        containerInfoView.addSubview(albumTitleLabel)
        containerInfoView.addSubview(genresLabel)
        containerInfoView.addSubview(releaseDateLabel)
        containerInfoView.addSubview(copyrightInfoLabel)
        
        albumTitleLabel.topAnchor.constraint(equalTo: containerInfoView.topAnchor).isActive = true
        albumTitleLabel.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor).isActive = true
        albumTitleLabel.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor).isActive = true
        albumTitleLabel.bottomAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: -5).isActive = true

        artistNameLabel.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: genresLabel.topAnchor, constant: -5).isActive = true

        genresLabel.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor).isActive = true
        genresLabel.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor).isActive = true
        genresLabel.bottomAnchor.constraint(equalTo: releaseDateLabel.topAnchor, constant: -5).isActive = true

        releaseDateLabel.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: copyrightInfoLabel.topAnchor, constant: -5).isActive = true

        copyrightInfoLabel.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor).isActive = true
        copyrightInfoLabel.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor).isActive = true
        copyrightInfoLabel.bottomAnchor.constraint(equalTo: containerInfoView.bottomAnchor).isActive = true
    }
}
