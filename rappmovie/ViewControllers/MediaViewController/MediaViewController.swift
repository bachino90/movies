//
//  MediaViewController.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class MediaViewController: TableViewController {

    let viewModel: MediaViewModel

    init(media: Media) {
        viewModel = MediaViewModel(media: media)
        super.init(nibName: "MediaViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Styler.Color.darkGray
        tableView.backgroundColor = Styler.Color.darkGray

        tableView.register(MediaHeaderCell.self)
        tableView.register(MediaOverviewCell.self)
        tableView.register(MediaVideoCell.self)

        let _ = viewModel.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
                self?.stateHasChanged(state)
            })

        viewModel.getDetails()
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

    @IBAction func close() {
        dismiss(animated: true)
    }
}

extension MediaViewController: MediaVideoRowDelegate {
    func actionDidRequestToPlay(video: Video) {
        let vc = VideoViewController(video: video)
        present(vc, animated: true)
    }
}
