//
//  MediaRow.swift
//  rappmovie
//
//  Created by Restorando on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaRow: Row {

    override var cellIdentifier: String { return MediaCollectionCell.defaultReuseIdentifier }

    let media: Media

    init(media: Media) {
        self.media = media
    }

    override func configureCell(_ cell: UIView) {
        if let cell = cell as? MediaCollectionCell {
            cell.configure(media: media)
        }
    }

    override func performAction() {
        delegate?.actionDidRequesToOpen(media: media)
    }

    fileprivate var delegate: MediaRowDelegate? {
        return actionDelegate as? MediaRowDelegate
    }
}

protocol MediaRowDelegate: ActionDelegate {
    func actionDidRequesToOpen(media: Media)
}
