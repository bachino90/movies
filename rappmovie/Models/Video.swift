//
//  Video.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Video: Model {

    let id: String
    let key: String
    let name: String
    let site: String
    let size: Int
    let type: String

    required init?(_ json: JSON) {
        guard
            let id = json["id"].string,
            let key = json["key"].string,
            let name = json["name"].string,
            let site = json["site"].string,
            let size = json["size"].int,
            let type = json["type"].string
            else { return nil }

        self.id = id
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
    }
}
