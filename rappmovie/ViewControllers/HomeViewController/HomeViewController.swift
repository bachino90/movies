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

        tableView.register(MediaCarrouselCell.self)

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
}

extension HomeViewController: MediaCarrouselRowDelegate {

    func rowDidRequestToOpen(media: Media) {
        let vc = MediaViewController(media: media)
        present(vc, animated: true)
    }
}
