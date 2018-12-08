//
//  MediaDetailsSection.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaDetailsSection: Section {

    init(media: Media, videos: [Video]? = nil) {
        super.init()
        rows = [
            MediaHeaderRow(media: media),
            MediaOverviewRow(overview: media.overview)
        ]
        if let videos = videos {
            rows.append(contentsOf: videos.map { MediaVideoRow(video: $0, backdropPath: media.backdropPath) })
        }
    }
}
