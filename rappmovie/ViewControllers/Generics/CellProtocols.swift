//
//  CellProtocols.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

protocol ActionDelegate: class { }

class Action: NSObject {

    weak var actionDelegate: ActionDelegate?
}

class PerformableAction: Action {

    func performAction() { fatalError("notImplemented") }
}

func ==(lhs: Row, rhs: Row) -> Bool { return ObjectIdentifier(lhs) == ObjectIdentifier(rhs) } //Override

class Row: PerformableAction {

    var cellIdentifier: String { get { fatalError("notImplemented") } }

    var cellHeight: CGFloat { get { fatalError("notImplemented") } }

    func configureCell(_ cell: UIView) { }

    func willDisplayCell(_ cell: UIView) { }

    func didDisplayCell(_ cell: UIView) { }

    func didEndDisplayingCell(_ cell: UIView) { }
}

protocol TableViewCell: ReusableView {

    static func cellHeight() -> CGFloat
}

class GenericRow<T: TableViewCell>: Row {

    override var cellIdentifier: String { get { return T.defaultReuseIdentifier } }

    override var cellHeight: CGFloat { get { return T.cellHeight() } }

    override func configureCell(_ cell: UIView) {
        if let cell = cell as? T { configureReusableCell(cell) }
    }

    override func willDisplayCell(_ cell: UIView) {
        if let cell = cell as? T { willDisplayReusableCell(cell) }
    }

    override func didDisplayCell(_ cell: UIView) {
        if let cell = cell as? T { didDisplayReusableCell(cell) }
    }

    override func didEndDisplayingCell(_ cell: UIView) {
        if let cell = cell as? T { didEndDisplayingReusableCell(cell) }
    }

    func configureReusableCell(_ cell: T) { }

    func willDisplayReusableCell(_ cell: T) { }

    func didDisplayReusableCell(_ cell: T) { }

    func didEndDisplayingReusableCell(_ cell: T) { }
}

class Section: Action {

    var rows = [Row]()

    var rowsCount: Int { return rows.count }

    var headerHeight: CGFloat { return 0.01 }

    func configureHeader(_ cell: UITableViewCell) { }

    var headerCellIdentifier: String? { return nil }

    override weak var actionDelegate: ActionDelegate? {
        didSet { rows.forEach { $0.actionDelegate = self.actionDelegate } }
    }
}
