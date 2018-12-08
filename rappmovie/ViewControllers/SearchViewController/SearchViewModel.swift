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

    private var disposable: Disposable?
    private var page = 1

    func search(query: String?) {
        guard let query = query, query.count > 1 else {
            state.value = .success([])
            return
        }
        disposable?.dispose()
        disposable = apiStore.search(query: query, page: page)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                let loadMore = response.page < response.totalPages
                self?.state.value = .success([SearchResultsSection(listOfMedia: response.results, loadMore: loadMore)])
                }, onError: { [weak self] _ in
                    self?.state.value = .error
            })
    }

    func loadMore() {
        page += 1
    }

    func resetPage() {
        page = 1
    }
}
