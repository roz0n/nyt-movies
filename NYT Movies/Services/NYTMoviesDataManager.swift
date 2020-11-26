//
//  NYTMoviesDataManager.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

import Foundation

class NYTMoviesDataManager {
    
    static let shared = NYTMoviesDataManager()
    var critics: [CriticModel]?
    
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
        
        let task = session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                // TODO: Present modal on error
                return
            }
            
            if let data = data {
                if let criticData: CriticAPIResponseModel = self.parseJSON(data) {
                    // TODO: Store data locally
                    print("Critic data parsing success!")
                    self.critics = criticData.results
                }
            }
        }

        task.resume()
    }
    
}


// MARK: - Data Utils

extension NYTMoviesDataManager {
    
    func parseJSON(_ data: Data) -> CriticAPIResponseModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CriticAPIResponseModel.self, from: data)
            let parsedData = CriticAPIResponseModel(results: decodedData.results)
            
            print(parsedData)
            return parsedData
        } catch {
            print("Error decoding JSON")
            return nil
        }
    }
    
}
