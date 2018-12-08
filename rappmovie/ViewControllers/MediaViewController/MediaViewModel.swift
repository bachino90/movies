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
        state.value = .success([MediaDetailsSection(media: media)])
        apiStore.getResource(media.type, byId: media.id)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.state.value = .success([
                    MediaDetailsSection(media: response.0),
                    MediaVideosSection(videos: response.1.videos, backdropPath: self?.media.backdropPath)
                    ])
                }, onError: { [weak self] _ in
                    self?.state.value = .error
            }).disposed(by: disposeBag)
    }
}
