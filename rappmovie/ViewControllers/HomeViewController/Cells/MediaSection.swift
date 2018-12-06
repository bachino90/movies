//
//  File.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaSection: Section {

    init(_ response: HomeResponse) {
        super.init()
        rows = response.movies.map { MediaCarrouselRow(mediaCollection: $1.movies, category: $0) }
        rows.append(contentsOf: response.tvShows.map { MediaCarrouselRow(mediaCollection: $1.tvShows, category: $0) })
    }
}
