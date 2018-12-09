//
//  CarrouselCell.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class CarrouselCell<T: UICollectionViewCell, M: Model>: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!

    var onSelectItem: ((M) -> Void)?

    var list: [M] = [] {
        didSet { collectionView.reloadData() }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(T.self)
    }

    func configure(cell: inout T, forItem item: M) {}

    // MARK: UICollectionViewDataSource, UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: T.defaultReuseIdentifier,
            for: indexPath
            ) as! T
        configure(cell: &cell, forItem: list[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectItem?(list[indexPath.row])
    }
}
