//
//  CriticsReviewsTableController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit
import SafariServices

class CriticsReviewsTableController: UITableViewController, SFSafariViewControllerDelegate {
    
    var reviews: [CriticReviewModel]?
    var svc: SFSafariViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(CriticsReviewCell.self, forCellReuseIdentifier: CriticsReviewCell.reuseId)
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CriticsReviewCell.reuseId, for: indexPath) as! CriticsReviewCell
        
        if let data = reviews?[indexPath.row] {
            cell.reviewData = data
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let reviewLink = self.reviews?[indexPath.row].link.url {
            let formattedLink = reviewLink.replacingOccurrences(of: "http://", with: "https://")
            let url = URL(string: formattedLink)
            
            configureSVC(url!)
            presentSVC()
        }
    }

    func presentSVC() {
        // Don't forget, Apple hates you: https://stackoverflow.com/questions/57134259
        let keyVC = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController!
        
        if let keyVC = keyVC {
            keyVC.present(svc, animated: true, completion: nil)
        }
    }
    
    func configureSVC(_ link: URL) {
        let config = SFSafariViewController.Configuration()
        
        config.entersReaderIfAvailable = true
        config.barCollapsingEnabled = true
        
        svc = SFSafariViewController(url: link, configuration: config)
        svc.delegate = self
    }
    
}
