//
//  HomeViewController.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewController: TableViewController {

    let viewModel = HomeViewModel()

    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Styler.Color.darkGray
        tableView.backgroundColor = Styler.Color.darkGray
        
        tableView.register(MediaCarrouselCell.self)
        tableView.register(HomeHeaderCell.self)

        tableView.contentInsetAdjustmentBehavior = .never

        let _ = viewModel.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
                self?.stateHasChanged(state)
            })

        viewModel.fetchHome()
    }

    func stateHasChanged(_ state: HomeViewModel.State) {

        switch state {
        case .initial: break
        case .loading: break
        case .error: break
        case .success(let sections):
            self.results = sections
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = rowAtIndexPath(indexPath)
        return row.cellHeight
    }

    @IBAction func openSearch() {
        let vc = SearchViewController()
        present(vc, animated: true)
    }
}

extension HomeViewController: MediaRowDelegate {

    func actionDidRequesToOpen(media: Media) {
        let vc = MediaViewController(media: media)
        present(vc, animated: true)
    }
}
