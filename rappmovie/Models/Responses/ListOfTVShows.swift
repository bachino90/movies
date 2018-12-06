//
//  ListOfTVShowsResponse.swift
//  rappmovie
//
//  Created by Restorando on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListOfTVShows: ResponseModel {

    let page: Int
    let totalResults: Int
    let totalPages: Int
    let tvShows: [TVShow]

    required init?(_ json: JSON) {
        guard let page = json["page"].int,
            let totalResults = json["total_results"].int,
            let totalPages = json["total_pages"].int,
            let tvShowsJson = json["results"].array else { return nil }

        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.tvShows = tvShowsJson.compactMap { TVShow($0) }
    }
}
