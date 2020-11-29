//
//  CriticsListViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsListViewController: UITableViewController {
    
    var critics: [CriticModel]?
    let endpoint = (NYTMoviesDataManager.shared.getEndpoint(for: "criticsList", reviewer: nil) + NYTMoviesDataManager.shared.attachApiKey())
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = K.Colors.NYTBlack
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CriticsListCell.self, forCellReuseIdentifier: CriticsListCell.reuseId)
        getCriticsListData()
    }
    
}

// MARK: - Navigation

extension CriticsListViewController {
    
    // TODO: Make this function more generic
    func pushPicksVC(critic: CriticModel) {
        let picksVC = CriticsReviewsViewController()
        picksVC.critic = critic
        navigationController?.pushViewController(picksVC, animated: true)
    }
    
}

extension CriticsListViewController {
    
    func getCriticsListData() {
        NYTMoviesDataManager.shared.getData(endpoint: self.endpoint, model: NYTCriticResponseModel.self) {
            if $1 != nil {
                // TODO: Handle error
                print("Error getting data :(")
            }
            
            if let results = $0?.results {
                self.critics = results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - Table View

extension CriticsListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.critics?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CriticsListCell.reuseId, for: indexPath) as! CriticsListCell
        cell.criticData = self.critics?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CriticsListCell.cellSize
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let critics = critics else { return }
        let selectedCritic = critics[indexPath.row]
        self.pushPicksVC(critic: selectedCritic)
    }
    
}
