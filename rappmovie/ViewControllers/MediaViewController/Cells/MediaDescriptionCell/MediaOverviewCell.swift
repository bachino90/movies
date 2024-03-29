//
//  MediaOverviewCell.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaOverviewCell: UITableViewCell, TableViewCell {

    static func cellHeight() -> CGFloat { return 120 }

    @IBOutlet private var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        overviewLabel.textColor = Styler.Color.darkWhite
        overviewLabel.font = UIFont.appRegularFontWith(size: 12)
        backgroundColor = Styler.Color.darkGray
    }

    func configure(overview: String) {
        overviewLabel.text = overview
    }
}
