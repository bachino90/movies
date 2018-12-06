//
//  File.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaSection: Section {

    init(results: [Media.Category: ListOfMovies]) {
        super.init()
        rows = results.map { MediaCarrouselRow(mediaCollection: $1.movies) }
    }
}
