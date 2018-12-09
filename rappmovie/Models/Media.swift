//
//  Media.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Media: Model {

    enum Category: String {
        case popular
        case topRated = "top_rated"
        case upcoming

        var title: String {
            switch self {
            case .popular: return "Most Popular"
            case .topRated: return "Top Rated"
            case .upcoming: return "Previews"
            }
        }
    }

    enum Resource: String {
        case movie
        case tvShow = "tv"

        var title: String {
            switch self {
            case .movie: return "Movies"
            case .tvShow: return "TV Shows"
            }
        }
    }

    let id: Int
    let title: String
    let posterPath: String
    let backdropPath: String?
    let popularity: Float
    let voteAverage: Float
    let overview: String
    let originalLanguage: String
    let voteCount: Int
    let genreIds: [Int]
    let genres: [Genre]
    let originCountry: [String]
    let releaseDate: Date?
    let runTime: Int?

    var type: Resource { return .movie }

    required init?(_ json: JSON) {
        guard
            let id = json["id"].int,
            let title = json["title"].string ?? json["name"].string,
            let posterPath = json["poster_path"].string,
            let overview = json["overview"].string,
            let popularity = json["popularity"].float,
            let voteAverage = json["vote_average"].float,
            let originalLanguage = json["original_language"].string,
            let voteCount = json["vote_count"].int
        else { return nil }

        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.originalLanguage = originalLanguage
        self.voteCount = voteCount
        self.runTime = json["runtime"].int
        self.backdropPath = json["backdrop_path"].string
        self.genres = json["genres"].arrayValue.compactMap { Genre($0) }
        self.genreIds = json["genre_ids"].arrayValue.compactMap { $0.int }
        self.originCountry = json["origin_country"].arrayValue.map { $0.stringValue }
        let releaseDate = json["release_date"].string ?? json["first_air_date"].string
        self.releaseDate = DateUtils.sharedInstance.releaseDateFormatter.date(from: releaseDate ?? "")
    }

}
