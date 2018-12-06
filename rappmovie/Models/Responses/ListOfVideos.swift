//
//  ListOfVideosResponse.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListOfVideos: ResponseModel {

    let id: Int
    let videos: [Video]

    required init?(_ json: JSON) {
        guard let id = json["id"].int,
            let videosJson = json["videos"].array else { return nil }

        self.id = id
        self.videos = videosJson.compactMap { Video($0) }
    }
}
