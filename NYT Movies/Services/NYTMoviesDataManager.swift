//
//  NYTMoviesDataManager.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

import Foundation

struct NYTMoviesDataManager {
    
    var apiKey: String?
    
    mutating func getEndpoint(_ city: String) -> String {
        
        if let path = Bundle.main.path(forResource: "Keys", ofType: ".plist") {
            let keys = NSDictionary.init(contentsOfFile: path)
            
            if let keys = keys {
                self.apiKey = keys["NYT_API_KEY"] as? String
            }
        }
        
        // TODO: Put url is some contants file pls
        return "https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=\(apiKey ?? "key-error")"
    }
    
    
    
}
