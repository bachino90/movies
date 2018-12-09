//
//  LoadingCell.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell, TableViewCell {

    static func cellHeight() -> CGFloat { return 80 }


    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    func startAnimating() {
        activityIndicator.startAnimating()
    }
}
