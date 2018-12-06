//
//  TVShow.swift
//  rappmovie
//
//  Created by Restorando on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class TVShow: Media {

    override var type: Resource { return .tvShow }

    required init?(_ json: JSON) {
        super.init(json)
    }

}
