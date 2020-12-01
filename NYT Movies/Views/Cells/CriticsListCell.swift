//
//  CriticsListCell.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsListCell: UITableViewCell {
    
    static let reuseId = "criticsCell"
    static let cellSize = CGFloat(100)
    static let photoSize = CGFloat(cellSize - 24)
    
    var criticData: CriticModel? {
        didSet {
            guard let criticData = criticData else { return }
            nameText.text = criticData.display_name
            bioText.text = criticData.bio
            
            if let photoUrl = criticData.multimedia?.resource?.src {
                let formattedUrl = photoUrl.replacingOccurrences(of: "http://", with: "https://")
                let url = URL(string: formattedUrl)
                photoImage.loadRemote(url: url!)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CriticsListCell.reuseId)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Wrappers
    
    // TODO: Restructure this view hierarchy so this is no longer needed
    
    let photoWrapper: UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - View Containers
    
    let photoContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        view.bounds = CGRect(x: 0, y: 0, width: photoSize, height: photoSize)
        view.layer.cornerRadius = photoSize / 2
        view.clipsToBounds = true
        
        return view
    }()
    
    let photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let infoContainer: UIView = {
        let view = UIView()

        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    // MARK: - Subviews
    
    let nameText: UITextView = {
        let view = UITextView()
        
        view.isPresentational()
        view.clipsToBounds = true
        view.font = .systemFont(ofSize: 12, weight: .bold)
        view.backgroundColor = .green
        
        return view
    }()
    
    let bioText: UITextView = {
        let text = UITextView()
        
        text.isPresentational()
        text.clipsToBounds = true
        text.textContainer.lineBreakMode = .byTruncatingTail
        text.font = .systemFont(ofSize: 12, weight: .regular)
        
        return text
    }()
}

// MARK: - Layout Configuration

extension CriticsListCell {
    
    func configureLayout() {
        configurePhotoWrapper()
        configurePhotoContainer()
        configureInfoContainer()
        configureSubviews()
    }
    
    // MARK: - Configure Wrappers
    
    func configurePhotoWrapper() {
        self.contentView.addSubview(photoWrapper)
        NSLayoutConstraint.activate([
            photoWrapper.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            photoWrapper.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoWrapper.heightAnchor.constraint(equalToConstant: CriticsListCell.cellSize),
            photoWrapper.widthAnchor.constraint(equalToConstant: CriticsListCell.cellSize)
        ])
    }
    
    // MARK: - Configure Containers

    func configurePhotoContainer() {
        photoWrapper.addSubview(photoContainer)
        photoContainer.addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            photoContainer.centerYAnchor.constraint(equalTo: photoWrapper.centerYAnchor),
            photoContainer.leadingAnchor.constraint(equalTo: photoWrapper.leadingAnchor, constant: 12),
            photoContainer.trailingAnchor.constraint(equalTo: photoWrapper.trailingAnchor, constant: -12),
            photoContainer.heightAnchor.constraint(equalToConstant: CriticsListCell.photoSize),
            photoImage.centerXAnchor.constraint(equalTo: photoContainer.centerXAnchor),
            photoImage.centerYAnchor.constraint(equalTo: photoContainer.centerYAnchor),
        ])
        
        photoImage.contentMode = .scaleAspectFit
    }
    
    func configureInfoContainer() {
        self.contentView.addSubview(infoContainer)
        NSLayoutConstraint.activate([
            infoContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            infoContainer.leadingAnchor.constraint(equalTo: photoWrapper.trailingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            infoContainer.heightAnchor.constraint(equalToConstant: CriticsListCell.cellSize)
        ])
    }
    
    // MARK: - Configure Subviews
    
    func configureSubviews() {
        configureNameText()
        configureBioText()
    }
    
    func configureNameText() {
        infoContainer.addSubview(nameText)
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: infoContainer.topAnchor),
            nameText.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor),
            nameText.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor),
        ])
    }
    
    func configureBioText() {
        infoContainer.addSubview(bioText)
        NSLayoutConstraint.activate([
            bioText.topAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 25),
            bioText.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor),
            bioText.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor),
            bioText.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
}
