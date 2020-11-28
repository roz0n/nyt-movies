//
//  NYTMoviesDataManager.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

import Foundation

/*
 
 This code is pretty wet (sherm, angel dust, pcp...) and bit of mess at the moment.
 TODO: refactor this class, its extension(s), and its delegate protocol to handle all API data types, not just Critics as it does now.
 There's also a ton of repetition and some jive code to generate the URL, but it's ok for now while we build out the UI.
 
 **/

protocol NYTMoviesDataManagerDelegate {
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel])
    
    // TODO: Figure out how to make this protocol optional
    func didUpdateCriticReviews(from service: NYTMoviesDataManager, _ data: [CriticReviewModel])
    func didError(from service: NYTMoviesDataManager, _ error: String)
}

class NYTMoviesDataManager {
    
    var delegate: NYTMoviesDataManagerDelegate?
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
    
    func fetchCriticData() {
        let endpoint = getEndpoint(for: "criticsList", reviewer: nil) + attachApiKey()
        guard let url = URL(string: endpoint) else { return }
        let session = URLSession(configuration: .default)
        
        DispatchQueue.global().async {
            let task = session.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    // TODO: Present modal as this error means a failure is not related to NYT but to some issue with the device connection or API key
                    return
                }
                
                if let data = data {
                    if let criticData: NYTDataResponseModel = self.parseJSON(data) {
                        self.delegate?.didUpdateData(from: self, criticData.results)
                    } else {
                        self.delegate?.didError(from: self, "Error decoding critics data!")
                    }
                }
            }
            
            task.resume()
        }
    }
    
    // TODO: Lots of repitition here..
    
    func fetchCriticReviews(of name: String) {
        let endpoint = (getEndpoint(for: "criticsReviews", reviewer: name) + attachApiKey()).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
        guard let url = URL(string: endpoint!) else { return }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                // TODO: Present modal as this error means a failure is not related to NYT but to some issue with the device connection or API key
                return
            }
            
            guard let data = data else { return }
            
            if let criticReviews: NYTDataResponseModelReview = self.parseJSON2(data) {
                self.delegate?.didUpdateCriticReviews(from: self, criticReviews.results)
            } else {
                self.delegate?.didError(from: self, "Error decoding critics reviews data!")
            }
        }
        
        task.resume()
    }
    
}


// MARK: - Data Utils

extension NYTMoviesDataManager {
    
    // TODO: Use a generic return type here to make this more extensible like the comment at the start of this file implies
    
    func parseJSON(_ data: Data) -> NYTDataResponseModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(NYTDataResponseModel.self, from: data)
            return NYTDataResponseModel(results: decodedData.results)
        } catch {
            return nil
        }
    }
    
    func parseJSON2(_ data: Data) -> NYTDataResponseModelReview? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(NYTDataResponseModelReview.self, from: data)
            return NYTDataResponseModelReview(results: decodedData.results)
        } catch {
            return nil
        }
    }
    
}
