//
//  MediaCarrouselRow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaCarrouselRow: GenericRow<MediaCarrouselCell> {

    let resource: Media.Resource
    let category: Media.Category
    let mediaCollection: [Media]

    init(mediaCollection: [Media], category: Media.Category, resource: Media.Resource) {
        self.resource = resource
        self.category = category
        self.mediaCollection = mediaCollection
    }

    override func configureReusableCell(_ cell: MediaCarrouselCell) {
        cell.list = mediaCollection
        cell.configure(resource: resource, category: category)
        cell.onSelectItem = { [weak self] media in
            self?.delegate?.actionDidRequesToOpen(media: media)
        }
    }

    override func performAction() {}

    fileprivate var delegate: MediaRowDelegate? {
        return actionDelegate as? MediaRowDelegate
    }
}
