//
//  File.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaSection: Section {

    init(_ response: HomeResponse) {
        super.init()

        rows = [HomeHeaderRow(media: response.movies[.upcoming]!.movies.first!)]
        rows.append(contentsOf: response.movies.map {
            MediaCarrouselRow(mediaCollection: $1.movies, category: $0, resource: .movie)
        })
        rows.append(contentsOf: response.tvShows.map {
            MediaCarrouselRow(mediaCollection: $1.tvShows, category: $0, resource: .tvShow)
        })
    }
}
