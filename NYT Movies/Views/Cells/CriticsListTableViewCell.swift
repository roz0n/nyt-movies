//
//  CriticsListTableViewCell.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsListTableViewCell: UITableViewCell {
    
    static let reuseId = "criticsCell"
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
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
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: rect)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .blue
        
        return view
    }()
    
    let infoContainer: UIView = {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: rect)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .cyan
        
        return view
    }()
    
}

// MARK: - Layout Configuration

extension CriticsListTableViewCell {
    
    func configureLayout() {
        self.contentView.addSubview(photoContainer)
        self.contentView.addSubview(infoContainer)
        
        NSLayoutConstraint.activate([
//            photoContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
//            photoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)

            infoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
            infoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            infoContainer.heightAnchor.constraint(equalToConstant: 100),
//            infoContainer.widthAnchor.constraint(equalToConstant: 100)
//            infoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
//            infoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
    }
    
}
