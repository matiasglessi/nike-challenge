//
//  AlbumsTableViewCell.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
        
    var album: Album? {
        didSet {
            guard let album = album else {return}
            albumArtImageView.image = UIImage(systemName: "x.square.fill")
            albumNameLabel.text = album.name
            artistNameLabel.text = album.artist
        }
    }

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
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
    
    private func configureCellUI() {
        self.contentView.addSubview(albumArtImageView)
        containerView.addSubview(albumNameLabel)
        containerView.addSubview(artistNameLabel)
        self.contentView.addSubview(containerView)
        
        albumArtImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumArtImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 10).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.albumArtImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        albumNameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo:self.albumNameLabel.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo:self.albumNameLabel.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
