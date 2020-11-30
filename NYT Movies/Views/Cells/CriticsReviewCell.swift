//
//  CriticsReviewCell.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit

class CriticsReviewCell: UITableViewCell {
    
    static let reuseId = "criticsPickCell"
    
    var reviewData: CriticReviewModel? {
        didSet {
            guard let reviewData = reviewData else { return }
            headlineText.text = reviewData.headline
            summaryText.text = reviewData.summary_short
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CriticsReviewCell.reuseId)
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

extension CriticsReviewCell {
    
    func configureLayout() {
        configureTextContainer()
        configureHeadlineText()
        configureSummaryText()
    }
    
    func configureTextContainer() {
        self.contentView.addSubview(textContainer)
        NSLayoutConstraint.activate([
            textContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textContainer.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            textContainer.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            textContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    func configureHeadlineText() {
        textContainer.addSubview(headlineText)
        headlineText.backgroundColor = .orange
        NSLayoutConstraint.activate([
            headlineText.topAnchor.constraint(equalTo: textContainer.topAnchor),
            headlineText.leftAnchor.constraint(equalTo: textContainer.leftAnchor),
            headlineText.rightAnchor.constraint(equalTo: textContainer.rightAnchor),
        ])
    }
    
    func configureSummaryText() {
        textContainer.addSubview(summaryText)
        summaryText.backgroundColor = .green
        NSLayoutConstraint.activate([
            summaryText.topAnchor.constraint(equalTo: headlineText.bottomAnchor),
            summaryText.leftAnchor.constraint(equalTo: headlineText.leftAnchor),
            summaryText.rightAnchor.constraint(equalTo: headlineText.rightAnchor),
            summaryText.bottomAnchor.constraint(equalTo: textContainer.bottomAnchor)
        ])
    }

}
