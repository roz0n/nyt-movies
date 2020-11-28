//
//  NYTDataModels.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/27/20.
//

struct NYTDataResponseModel: Codable {
    let results: [CriticModel]
}

struct CriticModel: Codable {
    let display_name: String?
    let sort_name: String?
    let status: String?
    let bio: String?
    let seo_name: String?
}
