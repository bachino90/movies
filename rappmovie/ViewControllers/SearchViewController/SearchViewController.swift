//
//  SearchViewController.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: CollectionViewController {

    @IBOutlet private var searchTextField: UITextField!

    private let viewModel = SearchViewModel()
    private var disposeBag = DisposeBag()

    init() {
        super.init(nibName: "SearchViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MediaCollectionCell.self)
        
        searchTextField.rx.text
            .throttle(0.4, latest: true, scheduler: MainScheduler.instance)
            .subscribe(onNext: { self.viewModel.search(query: $0) })
            .disposed(by: disposeBag)

        let _ = viewModel.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
                self?.stateHasChanged(state)
            })
    }

    @IBAction func dismiss() {
        dismiss(animated: true)
    }

    func stateHasChanged(_ state: StateViewModel.State) {

        switch state {
        case .initial: break
        case .loading: break
        case .error: break
        case .success(let sections):
            self.results = sections
        }
    }
}
