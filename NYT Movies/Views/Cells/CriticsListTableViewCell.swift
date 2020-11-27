//
//  CriticsListTableViewCell.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsListTableViewCell: UITableViewCell {
    
    static let reuseId = "criticsCell"
    static let cellHeight = CGFloat(100)
    
    var criticData: CriticModel? {
        didSet {
            guard let criticData = criticData else { return }
            nameText.text = criticData.display_name
            bioText.text = criticData.bio
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CriticsListTableViewCell.reuseId)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View containers
    
    let photoContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
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
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        view.isScrollEnabled = false
        view.isSelectable = false
        view.clipsToBounds = true
        view.font = .systemFont(ofSize: 12, weight: .bold)
//        view.text = "A.R. Criticgoy"
        view.backgroundColor = .green
        
        return view
    }()
    
    let bioText: UITextView = {
        let view = UITextView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        view.isScrollEnabled = false
        view.isSelectable = false
        view.clipsToBounds = true
        view.font = .systemFont(ofSize: 12, weight: .regular)
//        view.text = "He's just a goy from the citeh watchin flix and writin."
        
        return view
    }()
}

// MARK: - Layout Configuration

extension CriticsListTableViewCell {
    
    // MARK: - Configure containers
    
    func configureLayout() {
        configurePhotoContainer()
        configureInfoContainer()
        configureSubviews()
    }

    func configurePhotoContainer() {
        self.contentView.addSubview(photoContainer)
        NSLayoutConstraint.activate([
            photoContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            photoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoContainer.heightAnchor.constraint(equalToConstant: CriticsListTableViewCell.cellHeight),
            photoContainer.widthAnchor.constraint(equalToConstant: CriticsListTableViewCell.cellHeight)
        ])
    }
    
    func configureInfoContainer() {
        self.contentView.addSubview(infoContainer)
        NSLayoutConstraint.activate([
            infoContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            infoContainer.leadingAnchor.constraint(equalTo: photoContainer.trailingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            infoContainer.heightAnchor.constraint(equalToConstant: CriticsListTableViewCell.cellHeight)
        ])
    }
    
    // MARK: - Configure subviews
    
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
