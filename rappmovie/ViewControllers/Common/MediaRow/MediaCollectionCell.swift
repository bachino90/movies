//
//  MediaCollectionCell.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit
import AlamofireImage

class MediaCollectionCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!

    @IBOutlet private var releaseDateView: UIView!
    @IBOutlet private var releaseDateLabel: UILabel!

    let dateUtils = DateUtils.sharedInstance

    override func awakeFromNib() {
        super.awakeFromNib()

        releaseDateView.layer.cornerRadius = 4
        releaseDateView.backgroundColor = Styler.Color.red
        releaseDateView.isHidden = true

        releaseDateLabel.font = UIFont.appBoldFontWith(size: 11)
        releaseDateLabel.textColor = Styler.Color.lightWhite

        imageView.backgroundColor = Styler.Color.gray
    }

    func configure(media: Media) {
        imageView.image = nil
        if let url = URL(string: "https://image.tmdb.org/t/p/w300/\(media.posterPath)") {
            imageView.af_setImage(withURL: url)
        }
        releaseDateView.isHidden = media.releaseDate?.timeIntervalSinceNow <= 0

        if let releaseDate = media.releaseDate {
            let releaseYear = dateUtils.yearDateFormatter.string(from: releaseDate)
            let releaseMonth = dateUtils.monthDateFormatter.string(from: releaseDate)
            let todayYear = dateUtils.yearDateFormatter.string(from: Date())

            if todayYear == releaseYear {
                releaseDateLabel.text = releaseMonth
            } else {
                releaseDateLabel.text = releaseYear
            }
        }
        releaseDateLabel.text = releaseDateLabel.text?.uppercased()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.af_cancelImageRequest()
        imageView.image = nil
    }
}
