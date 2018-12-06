//
//  Genre.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre: Model {

    let id: Int
    let name: String

    required init?(_ json: JSON) {
        guard
            let id = json["id"].int,
            let name = json["name"].string
            else { return nil }

        self.id = id
        self.name = name
    }
}
