//
//  LoadingCollectionRow.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class LoadingCollectionRow: Row {

    override var cellIdentifier: String { return LoadingCollectionCell.defaultReuseIdentifier }

    override func willDisplayCell(_ cell: UIView) {
        if let cell = cell as? LoadingCollectionCell {
            cell.startAnimating()
        }
        delegate?.actionDidRequestToLoadMore()
    }

    fileprivate var delegate: LoadingRowDelegate? {
        return actionDelegate as? LoadingRowDelegate
    }
}

protocol LoadingRowDelegate: ActionDelegate {
    func actionDidRequestToLoadMore()
}
