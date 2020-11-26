//
//  PicksViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

class PicksViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PicksTableViewCell.self, forCellReuseIdentifier: PicksTableViewCell.reuseId)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - TableView Data

extension PicksViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PicksTableViewCell.reuseId, for: indexPath)
        return cell
    }
    
}
