//
//  LoadingCollectionCell.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class LoadingCollectionCell: UICollectionViewCell {

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    func startAnimating() {
        activityIndicator.startAnimating()
    }
}
