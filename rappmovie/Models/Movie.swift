//
//  Movie.swift
//  rappmovie
//
//  Created by Restorando on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie: Media {

    required init?(_ json: JSON) {
        super.init(json)
    }
}
