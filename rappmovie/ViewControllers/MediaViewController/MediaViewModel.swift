//
//  MediaViewModel.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class MediaViewModel: StateViewModel {

    let media: Media

    init(media: Media) {
        self.media = media
    }

    func getDetails() {
        apiStore.getResource(media.type, byId: media.id)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.state.value = .success([MediaDetailsSection(response.0)])
                }, onError: { [weak self] _ in
                    self?.state.value = .error
            }).disposed(by: disposeBag)
    }
}
