//
//  MediaVideoRow.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaVideoRow: GenericRow<MediaVideoCell> {

    let video: Video

    init(video: Video) {
        self.video = video
    }

    override func configureReusableCell(_ cell: MediaVideoCell) {
        cell.configure(video: video)
    }
}
