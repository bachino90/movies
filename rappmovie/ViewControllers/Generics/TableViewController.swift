//
//  TableViewController.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ActionDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Public Interface

    var results: [Section] = [] {
        didSet {
            results.forEach { $0.actionDelegate = self }
            reloadActions()
        }
    }

    func reloadActions() {
        tableView.reloadData()
    }

    func actionForRowAtIndexPath(_ indexPath: IndexPath) -> Row {
        let sectionAction = results[(indexPath as NSIndexPath).section]
        return sectionAction.rows[(indexPath as NSIndexPath).row]
    }

    func indexPathForAction(_ action: Row) -> IndexPath? {
        var sectionIndex = -1
        var rowIndex = -1
        for section in results {
            sectionIndex += 1
            for row in section.rows {
                rowIndex += 1
                if action === row { return IndexPath(row: rowIndex, section: sectionIndex) }
            }
            rowIndex = -1
        }
        return nil
    }

    // MARK: - Lifecycle

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backItem?.title = ""
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let action = results[section]
        return action.rowsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let action = actionForRowAtIndexPath(indexPath)
        if let cell = tableView.dequeueReusableCell(withIdentifier: action.cellIdentifier) {
            action.configureCell(cell)
            return cell
        }
        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let action = actionForRowAtIndexPath(indexPath)
        action.performAction()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let action = actionForRowAtIndexPath(indexPath)
        return action.cellHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionAction = results[section]
        if let headerIdentifier = sectionAction.headerCellIdentifier {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier)!
            sectionAction.configureHeader(cell)
            return cell
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let action = results[section]
        return action.headerHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let action = actionForRowAtIndexPath(indexPath)
        action.willDisplayCell(cell)
    }
}
