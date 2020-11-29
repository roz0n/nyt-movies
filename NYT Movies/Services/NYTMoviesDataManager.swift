//
//  NYTMoviesDataManager.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

import Foundation

class NYTMoviesDataManager {
        
    static let shared = NYTMoviesDataManager()
    
    func getEndpoint(for resource: String, reviewer: String?) -> String {
        let endpoints = [
            "criticsList": "https://api.nytimes.com/svc/movies/v2/critics/all.json?",
            "criticsReviews": "https://api.nytimes.com/svc/movies/v2/reviews/search.json?reviewer="
        ]
        
        return (endpoints[resource]! + (reviewer ?? ""))
    }
    
    func attachApiKey() -> String {
        var apiKey: String?
        
        if let path = Bundle.main.path(forResource: "Keys", ofType: ".plist") {
            let keys = NSDictionary.init(contentsOfFile: path)
            
            if let keys = keys {
                apiKey = keys["NYT_API_KEY"] as? String
            }
        }
        
        // TODO: Put url is some contants file pls
        return "&api-key=\(apiKey ?? "key-error")"
    }
    
    func getData<T>(endpoint: String, model: T.Type, completion: @escaping (_ parsedResponse: T?, _ error: Error?) -> Void) where T: Decodable {
        guard let url = URL(string: endpoint) else { return }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            guard let data = data else { return }
            
            do {
                let responseData = try JSONDecoder().decode(model.self, from: data)
                completion(responseData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
