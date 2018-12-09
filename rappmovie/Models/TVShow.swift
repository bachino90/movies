//
//  TVShow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class TVShow: Media {

    override var type: Resource { return .tvShow }

    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
//    let season: [Season]

    required init?(_ json: JSON) {
        numberOfEpisodes = json["number_of_episodes"].int
        numberOfSeasons = json["number_of_seasons"].int
        super.init(json)
    }

}
