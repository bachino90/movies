//
//  MediaCarrouselCell.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class MediaCarrouselCell: CarrouselCell<MediaCollectionCell, Media>, TableViewCell, UICollectionViewDelegateFlowLayout {

    @IBOutlet private var titleLabel: UILabel!
    
    static func cellHeight() -> CGFloat { return 200 }
    
    override func configure(cell: inout MediaCollectionCell, forItem item: Media) {
        cell.configure(media: item)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
