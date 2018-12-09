//
//  SearchViewModel.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel: StateViewModel {

    private var disposable: Disposable?
    private var page = 1
    private var results: [Media] = []

    var query: String? {
        didSet {
            if (query?.count ?? 0) > 1 {
                state.value = .success([SearchResultsSection(listOfMedia: [], loadMore: true)])
            }
            search()
        }
    }

    func loadMore() {
        page += 1
        search()
    }

    func resetPage() {
        page = 1
        results = []
    }

    private func search() {
        guard let query = self.query, query.count > 1 else {
            state.value = .success([])
            return
        }
        disposable?.dispose()
        disposable = apiStore.search(query: query, page: page)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] response in
                let loadMore = response.page < response.totalPages
                self.results.append(contentsOf: response.results)
                self.state.value = .success([SearchResultsSection(listOfMedia: self.results, loadMore: loadMore)])
                }, onError: { [weak self] _ in
                    self?.state.value = .error
            })
    }
}
