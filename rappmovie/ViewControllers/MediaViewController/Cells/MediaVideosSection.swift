//
//  MediaVideosSection.swift
//  rappmovie
//
//  Created by Restorando on 12/8/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaVideosSection: GenericSection<VideoHeaderCell> {

    init(videos: [Video]?, backdropPath: String?) {
        super.init()
        if let videos = videos {
            rows = videos.map { MediaVideoRow(video: $0, backdropPath: backdropPath) }
        } else {
            rows = [LoadingRow()]
        }
    }
}
