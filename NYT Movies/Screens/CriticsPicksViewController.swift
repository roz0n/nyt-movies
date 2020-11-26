//
//  CriticsPicksViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsPicksViewController: UITableViewController {
    
    var critics: [CriticModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PicksTableViewCell.self, forCellReuseIdentifier: PicksTableViewCell.reuseId)
        
        NYTMoviesDataManager.shared.delegate = self
        NYTMoviesDataManager.shared.fetchCriticData()
    }
    
}

// MARK: - TableView Data

extension CriticsPicksViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.critics?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PicksTableViewCell.reuseId, for: indexPath)
        return cell
    }
    
}

// MARK: - NYT Data Delegate

extension CriticsPicksViewController: NYTMoviesDataManagerDelegate {
    
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel]) {
        self.critics = data
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didError(from service: NYTMoviesDataManager, _ error: String) {
        print("Error fetching data... :(")
        print(error)
    }
    
}
