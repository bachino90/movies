//
//  MediaVideoRow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class MediaVideoRow: GenericRow<MediaVideoCell> {

    let video: Video
    let backdropPath: String?

    init(video: Video, backdropPath: String?) {
        self.video = video
        self.backdropPath = backdropPath
    }

    override func configureReusableCell(_ cell: MediaVideoCell) {
        cell.configure(video: video, backdropPath: backdropPath)
    }

    override func performAction() {
        delegate?.actionDidRequestToPlay(video: video)
    }

    fileprivate var delegate: MediaVideoRowDelegate? {
        return actionDelegate as? MediaVideoRowDelegate
    }
}

protocol MediaVideoRowDelegate: ActionDelegate {
    func actionDidRequestToPlay(video: Video)
}
