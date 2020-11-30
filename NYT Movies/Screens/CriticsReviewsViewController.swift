//
//  CriticsReviewsViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/27/20.
//

import UIKit

class CriticsReviewsViewController: UIViewController {
    
    var critic: CriticModel?
    var reviews: [CriticReviewModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = critic?.display_name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureLayouts()
        getCriticsReviewsData()
    }
    
    let bioContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let tableContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let bioText: UITextView = {
        let view = UITextView()
        
        view.isPresentational()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        
        return view
    }()
    
    let table = CriticsReviewsTableController()
    
}

// MARK: - Data Fetching

extension CriticsReviewsViewController {
    
    func getCriticsReviewsData() {
        let rawUrl = (NYTMoviesDataManager.shared.getEndpoint(for: "criticsReviews", reviewer: (critic?.display_name)!) + NYTMoviesDataManager.shared.attachApiKey())
        let formattedUrl = rawUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let endpoint = formattedUrl {
            NYTMoviesDataManager.shared.getData(endpoint: endpoint, model: NYTCriticsReviewsResponseModel.self) {
                if $1 != nil {
                    // TODO: Handle error
                    print("Error getting reviews data :(")
                }
                
                if let data = $0?.results {
                    self.reviews = data
                }
            }
            
            DispatchQueue.main.async {
                self.bioText.text = self.critic?.bio
                self.table.reviews = self.reviews
                self.table.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - Layout Configurations

extension CriticsReviewsViewController {
    
    func configureLayouts() {
        configureBioContainer()
        configureTableContainer()
        configureTableView()
        configureBioText()
    }
    
    func configureBioContainer() {
        view.addSubview(bioContainer)
        bioContainer.backgroundColor = .brown
        NSLayoutConstraint.activate([
            bioContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bioContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            bioContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func configureTableContainer() {
        view.addSubview(tableContainer)
        tableContainer.backgroundColor = .red
        NSLayoutConstraint.activate([
            tableContainer.topAnchor.constraint(equalTo: bioContainer.bottomAnchor),
            tableContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureTableView() {
        tableContainer.addSubview(table.view)
        NSLayoutConstraint.activate([
            table.view.topAnchor.constraint(equalTo: tableContainer.topAnchor),
            table.view.leftAnchor.constraint(equalTo: tableContainer.leftAnchor),
            table.view.rightAnchor.constraint(equalTo: tableContainer.rightAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureBioText() {
        bioContainer.addSubview(bioText)
        NSLayoutConstraint.activate([
            bioText.topAnchor.constraint(equalTo: bioContainer.topAnchor),
            bioText.leftAnchor.constraint(equalTo: bioContainer.leftAnchor, constant: 10),
            bioText.rightAnchor.constraint(equalTo: bioContainer.rightAnchor, constant: -10),
            bioContainer.heightAnchor.constraint(equalTo: bioText.heightAnchor)
        ])
    }
}
