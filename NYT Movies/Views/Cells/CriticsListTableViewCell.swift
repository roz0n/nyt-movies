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
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CriticsListTableViewCell.reuseId)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
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
    
}

// MARK: - Layout Configuration

extension CriticsListTableViewCell {
    
    func configureLayout() {
        configurePhotoContainer()
        configureInfoContainer()
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
    
}
