//
//  Model.swift
//  rappmovie
//
//  Created by Restorando on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Model {
    init?(_ json: JSON)
}
