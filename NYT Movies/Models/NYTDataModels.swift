//
//  NYTDataModels.swift
//  NYT Movies
//
//  Created by Arnaldo Rozon on 11/27/20.
//

// TODO: Lots of repetition with the response models, but how can we make types implicit while ahering to Codble?

struct NYTDataResponseModel: Codable {
    var results: [CriticModel]?
}

struct NYTDataResponseModelReview: Codable {
    let results: [CriticReviewModel]
}

struct CriticModel: Codable {
    let display_name: String?
    let sort_name: String?
    let status: String?
    let bio: String?
    let seo_name: String?
}

struct CriticReviewModel: Codable {
    let display_title: String?
    let mpaa_rating: String?
    let byline: String?
    let headline: String?
    let summary_short: String?
    let publication_date: String?
    let opening_date: String?
    let date_updated: String?
    let link: CriticReviewModelLink
    let multimedia: CriticReviewModelMedia
}

struct CriticReviewModelLink: Codable {
    let url: String?
    let suggested_link_text: String?
}

struct CriticReviewModelMedia: Codable {
    let src: String?
}
