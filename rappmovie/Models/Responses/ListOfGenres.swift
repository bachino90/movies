//
//  ListOfGenres.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListOfGenres: ResponseModel {

    let genres: [Genre]

    required init?(_ json: JSON) {
        guard let genresJson = json["genres"].array else { return nil }

        self.genres = genresJson.compactMap { Genre($0) }
    }

}
