//
//  SearchViewModel.swift
//  rappmovie
//
//  Created by Restorando on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel: StateViewModel {

    var disposable: Disposable?
    var page = 1

    func search(query: String?) {
        guard let query = query else { return }
        disposable?.dispose()
        disposable = apiStore.search(query: query, page: page)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.state.value = .success([SearchResultsSection(listOfMedia: response.results)])
                }, onError: { [weak self] _ in
                    self?.state.value = .error
            })
    }
}
