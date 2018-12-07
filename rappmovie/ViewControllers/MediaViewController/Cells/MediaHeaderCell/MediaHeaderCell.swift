//
//  MediaHeaderCell.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaHeaderCell: UITableViewCell, TableViewCell {

    static func cellHeight() -> CGFloat { return 240 }

    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        subtitleLabel.textColor = Styler.Color.darkWhite
    }

    func configure(media: Media) {
        if let posterUrl = URL(string: "https://image.tmdb.org/t/p/w300/\(media.posterPath)") {
            posterImageView.af_setImage(withURL: posterUrl)
            backgroundImageView.af_setImage(withURL: posterUrl)
        }

        let darkBlur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = backgroundImageView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurView)

        var subtitles: [String] = []

        if let releaseDate = media.releaseDate {
            subtitles.append(DateUtils.sharedInstance.yearDateFormatter.string(from: releaseDate))
        }

        if let runtime = media.runTime {
            let hours = runtime / 60
            let minutes = (runtime % 60) * 60 / 100
            var time = ""
            if hours > 0 {
                time = "\(hours)h"
            }
            if minutes > 0 {
                time = time + " \(minutes)m"
            }
            subtitles.append(time)
        }

        subtitleLabel.text = subtitles.joined(separator: " ・ ")
    }

}
