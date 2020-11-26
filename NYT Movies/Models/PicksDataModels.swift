//
//  PicksDataModels.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/26/20.
//

struct CriticModel: Codable {
    let display_name: String?
    let sort_name: String?
    let status: String?
    let bio: String?
    let seo_name: String?
}

struct CriticAPIResponseModel: Codable {
    let results: [CriticModel]
}
