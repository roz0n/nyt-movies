//
//  CriticsPicksViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/27/20.
//

import UIKit

class CriticsPicksViewController: UIViewController, NYTMoviesDataManagerDelegate {
    
    var critic: CriticModel?
    var reviews: [CriticReviewModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = critic?.display_name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        NYTMoviesDataManager.shared.delegate = self
        NYTMoviesDataManager.shared.fetchCriticReviews(of: (critic?.display_name)!)
        
        configureLayouts()
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
    
}

// MARK: - NYT Data Delegate

extension CriticsPicksViewController {
    
    func didUpdateCriticReviews(from service: NYTMoviesDataManager, _ data: [CriticReviewModel]) {
        self.reviews = data
        
        DispatchQueue.main.async {
            let bio = self.critic?.bio?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            self.bioText.text = bio ?? "No bio available"
        }
    }
    
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel]) {
        
    }
    
    func didError(from service: NYTMoviesDataManager, _ error: String) {
        print("Error: CriticsPicks View")
    }
    
}

// MARK: - Layout Configurations

extension CriticsPicksViewController {
    
    func configureLayouts() {
        configureBioContainer()
        configureTableContainer()
        configureTableView()
        configureBioText()
    }
    
    func configureBioContainer() {
        view.addSubview(bioContainer)
        NSLayoutConstraint.activate([
            bioContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bioContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            bioContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func configureTableContainer() {
        view.addSubview(tableContainer)
        NSLayoutConstraint.activate([
            tableContainer.topAnchor.constraint(equalTo: bioContainer.bottomAnchor),
            tableContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureTableView() {
        let table = CriticsPicksTableController()
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
