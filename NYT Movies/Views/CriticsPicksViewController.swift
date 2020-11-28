//
//  CriticsPicksViewController.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/27/20.
//

import UIKit

class CriticsPicksViewController: UIViewController, NYTMoviesDataManagerDelegate {
    
    var criticData: CriticModel?
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = criticData?.display_name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NYTMoviesDataManager.shared.delegate = self
    }

}

// MARK: - NYT Data Delegate

extension CriticsPicksViewController {
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel]) {
        
    }
    
    func didError(from service: NYTMoviesDataManager, _ error: String) {
        print("Error: CriticsPicks View")
    }
}
