//
//  MediaCarrouselRow.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaCarrouselRow: GenericRow<MediaCarrouselCell> {

    let category: Media.Category
    let mediaCollection: [Media]

    init(mediaCollection: [Media], category: Media.Category) {
        self.category = category
        self.mediaCollection = mediaCollection
    }

    override func configureReusableCell(_ cell: MediaCarrouselCell) {
        cell.list = mediaCollection
        cell.configure(category: category)
        cell.onSelectItem = { [weak self] media in
            self?.delegate?.rowDidRequestToOpen(media: media)
        }
    }

    override func performAction() {}

    fileprivate var delegate: MediaCarrouselRowDelegate? {
        return actionDelegate as? MediaCarrouselRowDelegate
    }
}

protocol MediaCarrouselRowDelegate: ActionDelegate {
    func rowDidRequestToOpen(media: Media)
}
