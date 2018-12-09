//
//  HomeResponse.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class HomeResponse {

    let movies: [Media.Category: ListOfMovies]
    let tvShows: [Media.Category: ListOfTVShows]

    init(movies: [Media.Category: ListOfMovies], tvShows: [Media.Category: ListOfTVShows]) {
        self.movies = movies
        self.tvShows = tvShows
    }
}
