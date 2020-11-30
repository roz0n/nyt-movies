//
//  CriticsReviewsTableController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/28/20.
//

import UIKit

class CriticsReviewsTableController: UITableViewController {
    
    var reviews: [CriticReviewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(CriticsReviewCell.self, forCellReuseIdentifier: CriticsReviewCell.reuseId)
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Do we really need this set?
//        tableView.rowHeight = CriticsReviewCell.cellSize
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
        print("Selected row \(String(indexPath.row))")
        let vc = ReviewWebViewController()
        present(vc, animated: true, completion: nil)
    }
    
}
