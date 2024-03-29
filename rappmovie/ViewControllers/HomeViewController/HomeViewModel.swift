//
//  HomeViewModel.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel: StateViewModel {

    func fetchHome() {
        state.value = .loading
        apiStore.homeObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.state.value = .success([MediaSection(response)])
            }, onError: { [weak self] _ in
                self?.state.value = .error
            }).disposed(by: disposeBag)
    }
}
