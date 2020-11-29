//
//  CriticsPicksCell.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit

class CriticsPicksCell: UITableViewCell {
    
    static let reuseId = "criticsPickCell"
    static let cellSize = CGFloat(75)
    
    var reviewData: CriticReviewModel? {
        didSet {
            guard let reviewData = reviewData else { return }
            print(reviewData)
            headlineText.text = reviewData.headline
            summaryText.text = reviewData.summary_short
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CriticsPicksCell.reuseId)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    let headlineText: UITextView = {
        let text = UITextView()
        
        text.isPresentational()
        text.clipsToBounds = true
        text.font = .systemFont(ofSize: 12, weight: .regular)
        
        return text
    }()
    
    let summaryText: UITextView = {
        let text = UITextView()
        
        text.isPresentational()
        text.clipsToBounds = true
        text.font = .systemFont(ofSize: 12, weight: .regular)
        
        return text
    }()
}

extension CriticsPicksCell {
    
    func configureLayout() {
        configureTextContainer()
        configureHeadlineText()
    }
    
    func configureTextContainer() {
        self.contentView.addSubview(textContainer)
        NSLayoutConstraint.activate([
            textContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            textContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            textContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
    }
    
    func configureHeadlineText() {
        textContainer.addSubview(headlineText)
        headlineText.backgroundColor = .orange
        NSLayoutConstraint.activate([
            headlineText.topAnchor.constraint(equalTo: textContainer.topAnchor),
            headlineText.leftAnchor.constraint(equalTo: textContainer.leftAnchor),
            headlineText.rightAnchor.constraint(equalTo: textContainer.rightAnchor),
            headlineText.heightAnchor.constraint(equalToConstant: CriticsPicksCell.cellSize)
        ])
    }

}
