//
//  SearchResultsSection.swift
//  rappmovie
//
//  Created by Restorando on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class SearchResultsSection: Section {

    init(listOfMedia: [Media]) {
        super.init()
        rows = listOfMedia.map { MediaRow(media: $0) }
    }
}
