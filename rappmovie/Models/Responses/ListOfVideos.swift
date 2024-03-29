//
//  ListOfVideosResponse.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListOfVideos: ResponseModel {

    let id: Int
    let videos: [Video]

    required init?(_ json: JSON) {
        guard let id = json["id"].int,
            let videosJson = json["results"].array else { return nil }

        self.id = id
        self.videos = videosJson.compactMap { Video($0) }
    }
}
