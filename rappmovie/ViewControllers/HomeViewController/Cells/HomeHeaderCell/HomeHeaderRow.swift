//
//  HomeHeaderRow.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

class HomeHeaderRow: GenericRow<HomeHeaderCell> {

    let media: Media

    init(media: Media) {
        self.media = media
    }

    override func configureReusableCell(_ cell: HomeHeaderCell) {
        cell.configure(media: media)
    }

    override func performAction() {
        delegate?.actionDidRequesToOpen(media: media)
    }

    fileprivate var delegate: MediaRowDelegate? {
        return actionDelegate as? MediaRowDelegate
    }
}
