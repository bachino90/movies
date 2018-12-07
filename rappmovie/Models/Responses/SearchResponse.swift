//
//  SearchResponse.swift
//  rappmovie
//
//  Created by Restorando on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class SearchResponse: ResponseModel {

    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Media]

    required init?(_ json: JSON) {
        guard let page = json["page"].int,
            let totalResults = json["total_results"].int,
            let totalPages = json["total_pages"].int,
            let resultsJson = json["results"].array else { return nil }

        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = resultsJson.compactMap { Media($0) }
    }
}
