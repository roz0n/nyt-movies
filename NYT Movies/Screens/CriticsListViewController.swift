//
//  CriticsListViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class CriticsListViewController: UITableViewController {
    
    var critics: [CriticModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CriticsListCell.self, forCellReuseIdentifier: CriticsListCell.reuseId)
        
        NYTMoviesDataManager.shared.delegate = self
        NYTMoviesDataManager.shared.fetchCriticData()
    }
    
}

// MARK: - TableView Data

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
        self.pushPicksVC(critic: critics[indexPath.row])
    }
    
}

// MARK: - NYT Data Delegate

extension CriticsListViewController: NYTMoviesDataManagerDelegate {
    
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

// MARK: - Navigation

extension CriticsListViewController {
    
    // TODO: Make this function more generic
    func pushPicksVC(critic: CriticModel) {
        let picksVC = CriticsPicksViewController()
        picksVC.criticData = critic
        navigationController?.pushViewController(picksVC, animated: true)
    }
    
}
