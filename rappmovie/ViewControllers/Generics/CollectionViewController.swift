//
//  CollectionViewController.swift
//  rappmovie
//
//  Created by Restorando on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ActionDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Public Interface

    var results: [Section] = [] {
        didSet {
            results.forEach { $0.actionDelegate = self }
            reloadData()
        }
    }

    /// Override this method to reload collectionView
    func reloadData() {
        collectionView?.reloadData()
    }

    func rowAtIndexPath(_ indexPath: IndexPath) -> Row {
        let sectionAction = results[(indexPath as NSIndexPath).section]
        return sectionAction.rows[(indexPath as NSIndexPath).row]
    }

    func indexPathForRow(_ row: Row) -> IndexPath? {
        var sectionIndex = -1
        var rowIndex = -1
        for section in results {
            sectionIndex += 1
            for aRow in section.rows {
                rowIndex += 1
                if aRow === row { return IndexPath(row: rowIndex, section: sectionIndex) }
            }
            rowIndex = -1
        }
        return nil
    }

    // MARK: - UICollectionViewDelegate & UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionAction = results[section]
        return sectionAction.rowsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = rowAtIndexPath(indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.cellIdentifier, for: indexPath)
        row.configureCell(cell)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = rowAtIndexPath(indexPath)
        row.performAction()
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let row = rowAtIndexPath(indexPath)
        row.willDisplayCell(cell)
    }
}
