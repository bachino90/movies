//
//  MediaOverviewRow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaOverviewRow: GenericRow<MediaOverviewCell> {

    let overview: String

    init(overview: String) {
        self.overview = overview
    }

    override func configureReusableCell(_ cell: MediaOverviewCell) {
        cell.configure(overview: overview)
    }
}
