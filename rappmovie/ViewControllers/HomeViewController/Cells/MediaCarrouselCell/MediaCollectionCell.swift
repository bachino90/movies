//
//  MediaCollectionCell.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit
import AlamofireImage

class MediaCollectionCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!

    func configure(media: Media) {
        if let poster = media.posterPath,
            let url = URL(string: "https://image.tmdb.org/t/p/w300/\(poster)") {
            imageView.af_setImage(withURL: url)
        }
    }
}
