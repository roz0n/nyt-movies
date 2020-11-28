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
        tableView.register(CriticsListTableViewCell.self, forCellReuseIdentifier: CriticsListTableViewCell.reuseId)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CriticsListTableViewCell.reuseId, for: indexPath) as! CriticsListTableViewCell
        cell.criticData = self.critics?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CriticsListTableViewCell.cellSize
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
