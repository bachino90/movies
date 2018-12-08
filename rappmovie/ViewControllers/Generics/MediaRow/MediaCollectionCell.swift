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

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = Styler.Color.gray
    }

    func configure(media: Media) {
        imageView.image = nil
        if let url = URL(string: "https://image.tmdb.org/t/p/w300/\(media.posterPath)") {
            imageView.af_setImage(withURL: url)
        }
    }
}