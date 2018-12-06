//
//  HomeViewModel.swift
//  rappmovie
//
//  Created by Restorando on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {

    // MARK: - StateViewModel State

    enum State {
        case initial
        case loading
        case error
        case success([Section])
    }

    // MARK: - Public Properties

    var state: Variable<State> = Variable(.initial)
    var disposeBag = DisposeBag()

    private let apiStore = APIStore()

    func fetchHome() {
        apiStore.homeObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.state.value = .success([MediaSection(response)])
            }, onError: { [weak self] _ in
                self?.state.value = .error
            }).disposed(by: disposeBag)
    }
}
