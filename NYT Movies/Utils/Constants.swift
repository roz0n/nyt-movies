//
//  Constants.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/25/20.
//

import UIKit

struct K {
    
    struct API {
        static let endpoints = [
            "criticsList": "https://api.nytimes.com/svc/movies/v2/critics/all.json?",
            "criticsReviews": "https://api.nytimes.com/svc/movies/v2/reviews/search.json?reviewer="
        ]
    }
    
    struct Colors {
        static let NYTWhite = UIColor(r: 248, g: 247, b: 247, a: 1)
        static let NYTBlack = UIColor(r: 12, g: 12, b: 13, a: 1)
    }
    
    struct SearchViewCopy {
        static let EmptyStateText = "Looking for something?"
        static let SearchBarPlaceholder = "Search for a movie"
    }
    
}
