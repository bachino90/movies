//
//  Media.swift
//  rappmovie
//
//  Created by Restorando on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Media: Model {

    enum Category: String {
        case popular
        case topRated = "top_rated"
        case upcoming
    }

    enum Resource: String {
        case movies = "movie"
        case tvShows = "tv"
    }

    let id: Int
    let posterPath: String?
    let popularity: Float
    let voteAverage: Float
    let overview: String
    let originalLanguage: String
    let voteCount: Int
    let genreIds: [Int]
    let originCountry: [String]


    required init?(_ json: JSON) {
        guard
            let id = json["id"].int,
            let overview = json["overview"].string,
            let popularity = json["popularity"].float,
            let voteAverage = json["vote_average"].float,
            let originalLanguage = json["original_language"].string,
            let voteCount = json["vote_count"].int,
            let genreIdsArray = json["genre_ids"].array
        else { return nil }

        self.posterPath = json["poster_path"].string

        self.id = id
        self.overview = overview
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.originalLanguage = originalLanguage
        self.voteCount = voteCount
        self.genreIds = genreIdsArray.map { $0.intValue }
        self.originCountry = json["origin_country"].arrayValue.map { $0.stringValue }
    }

}
