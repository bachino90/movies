//
//  MediaHeaderRow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaHeaderRow: GenericRow<MediaHeaderCell> {

    let media: Media

    init(media: Media) {
        self.media = media
    }

    override func configureReusableCell(_ cell: MediaHeaderCell) {
        cell.configure(media: media)
    }
}
