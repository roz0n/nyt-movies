//
//  EmptyStateViews.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

struct EmptyStateViews {
    
    struct Search {
        static func image() -> UIImageView {
            let imageView: UIImageView = {
                let image = UIImage(systemName: "magnifyingglass.circle.fill")
                let view = UIImageView(image: image)
                
                view.tintColor = K.Colors.NYTBlack.withAlphaComponent(0.15)
                view.translatesAutoresizingMaskIntoConstraints = false
                
                return view
            }()
            
            return imageView
        }
        
        static func text() -> UITextView {
            let textView: UITextView = {
                let view = UITextView()
                
                view.isEditable = false
                view.isScrollEnabled = false
                view.translatesAutoresizingMaskIntoConstraints = false
                
                view.text = K.SearchViewCopy.EmptyStateText
                view.textAlignment = .center
                view.backgroundColor = .none
                view.font = .systemFont(ofSize: 16, weight: .regular)
                view.textColor = .systemGray2
                
                return view
            }()
            
            return textView
        }
    }
    
}
