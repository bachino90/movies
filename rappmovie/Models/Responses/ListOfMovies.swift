//
//  ListOfMoviesResponse.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListOfMovies: ResponseModel {

    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]

    required init?(_ json: JSON) {
        guard let page = json["page"].int,
            let totalResults = json["total_results"].int,
            let totalPages = json["total_pages"].int,
            let moviesJson = json["results"].array else { return nil }

        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.movies = moviesJson.compactMap { Movie($0) }
    }
}
