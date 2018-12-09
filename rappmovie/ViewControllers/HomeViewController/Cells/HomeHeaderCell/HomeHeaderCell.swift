//
//  HomeHeaderCell.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class HomeHeaderCell: UITableViewCell, TableViewCell {

    static func cellHeight() -> CGFloat { return 260 }

    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageView.backgroundColor = Styler.Color.darkGray
        titleLabel.textColor = Styler.Color.darkWhite
        titleLabel.font = UIFont.appSemiBoldFontWith(size: 25)
        titleLabel.shadowColor = Styler.Color.darkGray
        titleLabel.shadowOffset = CGSize(width: 0.8, height: 1.1)
    }

    func configure(media: Media) {
        titleLabel.text = media.title
        
        if let backdropPath = media.backdropPath,
            let url = URL(string: "https://image.tmdb.org/t/p/w780/\(backdropPath)") {
            backgroundImageView.af_setImage(withURL: url)
        }
    }
}
