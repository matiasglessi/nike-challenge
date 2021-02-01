//
//  AlbumsTableViewCell.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    
    private var albumCellViewModel: AlbumCellViewModel!
    
    var album: Album? {
        didSet {
            guard let album = album else { return }
            getAlbumArt(from: album.albumArt)
            albumNameLabel.text = album.name
            artistNameLabel.text = album.artist
        }
    }
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumArtImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        return stackView
    }()
    
    private func configureCellUI() {
        self.contentView.addSubview(albumArtImageView)
        self.contentView.addSubview(infoStackView)
        infoStackView.addArrangedSubview(albumNameLabel)
        infoStackView.addArrangedSubview(artistNameLabel)
        
        albumArtImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        albumArtImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        infoStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        infoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true

        infoStackView.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 10).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.albumCellViewModel = AlbumCellViewModel(getAlbumArt: DefaultGetAlbumArtService(apiClient: URLSessionAPIClient()))
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.albumCellViewModel = AlbumCellViewModel(getAlbumArt: DefaultGetAlbumArtService(apiClient: URLSessionAPIClient()))
        super.init(coder: aDecoder)

    }
    
    private func getAlbumArt(from link: String) {
        albumCellViewModel.getAlbumArt(for: link) { (albumArt) in
            DispatchQueue.main.async {
                self.albumArtImageView.image = albumArt
            }
        }
    }
}
