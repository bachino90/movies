//
//  SearchResultsSection.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class SearchResultsSection: Section {

    init(listOfMedia: [Media], loadMore: Bool) {
        super.init()
        rows = listOfMedia.map { MediaRow(media: $0) }
        if loadMore {
            rows.append(LoadingCollectionRow())
        }
    }
}
