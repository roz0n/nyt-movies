//
//  SearchViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
}

// MARK: - Layout Setup

extension SearchViewController {
    
    private func setupLayout() {
        view.backgroundColor = K.Colors.NYTWhite

        let imageView = EmptyStateViews.Search.image()
        let textView = EmptyStateViews.Search.text()
        
        let sbView: UISearchBar = {
            let sb = UISearchBar()
            
            sb.translatesAutoresizingMaskIntoConstraints = false
            sb.returnKeyType = .search
            sb.keyboardType = .alphabet
            sb.placeholder = K.SearchViewCopy.SearchBarPlaceholder
            
            return sb
        }()
        
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(sbView)
        
        NSLayoutConstraint.activate([
            sbView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            sbView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            sbView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

// MARK: - Search Bar Delegate

extension SearchViewController: UISearchBarDelegate {}
