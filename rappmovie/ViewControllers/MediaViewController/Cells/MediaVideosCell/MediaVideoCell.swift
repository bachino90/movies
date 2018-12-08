//
//  MediaVideoCell.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaVideoCell: UITableViewCell, TableViewCell {

    static func cellHeight() -> CGFloat { return 120 }

    @IBOutlet private var videoImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var siteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = Styler.Color.darkGray

        videoImageView.backgroundColor = Styler.Color.gray
        titleLabel.textColor = Styler.Color.darkWhite
        titleLabel.font = UIFont.appSemiBoldFontWith(size: 14)

        siteLabel.textColor = Styler.Color.lightGray
        siteLabel.font = UIFont.appRegularFontWith(size: 12)
    }

    func configure(video: Video, backdropPath: String?) {
        titleLabel.text = video.name
        siteLabel.text = video.site

        if let backdropPath = backdropPath,
            let url = URL(string: "https://image.tmdb.org/t/p/w300/\(backdropPath)") {
            videoImageView.af_setImage(withURL: url)
        }
    }
}
