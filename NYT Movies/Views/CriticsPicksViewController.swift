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
    }

}

// MARK: - NYT Data Delegate

extension CriticsPicksViewController {
    func didUpdateCriticReviews(from service: NYTMoviesDataManager, _ data: [CriticReviewModel]) {
        self.reviews = data
    }
    
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel]) {
        
    }
    
    func didError(from service: NYTMoviesDataManager, _ error: String) {
        print("Error: CriticsPicks View")
    }
}
