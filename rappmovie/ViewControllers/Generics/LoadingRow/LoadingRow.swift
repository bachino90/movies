//
//  LoadingRow.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class LoadingRow: GenericRow<LoadingCell> {

    override func willDisplayReusableCell(_ cell: LoadingCell) {
        cell.startAnimating()
        delegate?.actionDidRequestToLoadMore()
    }

    fileprivate var delegate: LoadingRowDelegate? {
        return actionDelegate as? LoadingRowDelegate
    }
}
