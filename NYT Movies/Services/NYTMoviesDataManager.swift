//
//  NYTMoviesDataManager.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

import Foundation

// TODO: Modify this class, its extension(s), and its delegate protocol to handle all API data types, not just Critics as it does now

protocol NYTMoviesDataManagerDelegate {
    func didUpdateData(from service: NYTMoviesDataManager, _ data: [CriticModel])
    func didError(from service: NYTMoviesDataManager, _ error: String)
}

class NYTMoviesDataManager {
    
    var delegate: NYTMoviesDataManagerDelegate?
    static let shared = NYTMoviesDataManager()
    
    func getEndpoint() -> String {
        var apiKey: String?
        
        if let path = Bundle.main.path(forResource: "Keys", ofType: ".plist") {
            let keys = NSDictionary.init(contentsOfFile: path)
            
            if let keys = keys {
                apiKey = keys["NYT_API_KEY"] as? String
            }
        }
        
        // TODO: Put url is some contants file pls
        return "https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=\(apiKey ?? "key-error")"
    }
    
    func fetchCriticData() {
        let endpoint = getEndpoint()
        guard let url = URL(string: endpoint) else { return }
        let session = URLSession(configuration: .default)
        
        DispatchQueue.global().async {
            let task = session.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    // TODO: Present modal as this error means a failure is not related to NYT but to some issue with the device connection or API key
                    return
                }
                
                if let data = data {
                    if let criticData: CriticsPicksResponseModel = self.parseJSON(data) {
                        self.delegate?.didUpdateData(from: self, criticData.results)
                    } else {
                        self.delegate?.didError(from: self, "Error decoding critics data!")
                    }
                }
            }
            
            task.resume()
        }
    }
    
}


// MARK: - Data Utils

extension NYTMoviesDataManager {
    
    // TODO: Use a generic return type here to make this more extensible like the comment at the start of this file implies
    func parseJSON(_ data: Data) -> CriticsPicksResponseModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CriticsPicksResponseModel.self, from: data)
            return CriticsPicksResponseModel(results: decodedData.results)
        } catch {
            return nil
        }
    }
    
}
