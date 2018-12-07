//
//  MediaStore.swift
//  rappmovie
//
//  Created by Restorando on 12/4/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class APIStore: NetworkStore {

    func homeObservable() -> Observable<HomeResponse> {
        let movies = [getMovies(category: .popular, page: 1),
                      getMovies(category: .topRated, page: 1),
                      getMovies(category: .upcoming, page: 1)]
        let moviesObs = Observable.zip(movies) { responses -> [Media.Category: ListOfMovies] in
            var dict: [Media.Category: ListOfMovies] = [:]
            responses.forEach { dict[$0.0] = $0.1 }
            return dict
        }

        let tvShows = [getTVShows(category: .popular, page: 1),
                       getTVShows(category: .topRated, page: 1)]
        let tvShowsObs = Observable.zip(tvShows) { responses -> [Media.Category: ListOfTVShows] in
            var dict: [Media.Category: ListOfTVShows] = [:]
            responses.forEach { dict[$0.0] = $0.1 }
            return dict
        }

        return Observable.zip(moviesObs, tvShowsObs) { HomeResponse(movies: $0, tvShows: $1) }
    }

    // Resources

    func getMovies(category: Media.Category, page: Int) -> Observable<(Media.Category, ListOfMovies)> {
        let route = API.ResourceList(resource: .movie, category: category, page: page)
        return observableRequest(route).map { (category, $0) }
    }

    func getTVShows(category: Media.Category, page: Int) -> Observable<(Media.Category, ListOfTVShows)> {
        let route = API.ResourceList(resource: .tvShow, category: category, page: page)
        return observableRequest(route).map { (category, $0) }
    }

    func getResource(_ resource: Media.Resource, byId id: Int) -> Observable<(Media, ListOfVideos)> {
        let videoObs = getVideo(forResource: resource, forId: id)
        if resource == .movie {
            let mediaObs: Observable<Movie> = observableRequest(API.Resource(resource: resource, id: id))
            return Observable.zip(mediaObs, videoObs) { ($0, $1) }
        } else {
            let mediaObs: Observable<TVShow> = observableRequest(API.Resource(resource: resource, id: id))
            return Observable.zip(mediaObs, videoObs) { ($0, $1) }
        }
    }

    // Videos

    func getVideo(forResource resource: Media.Resource, forId id: Int) -> Observable<ListOfVideos> {
        return observableRequest(API.Video(resource: resource, id: id))
    }

    // Genres

    func getGenres() -> Observable<Set<Genre>>  {
        let movieGenres = getGenre(resource: .movie).map { $0.genres }
        let tvShowGenres = getGenre(resource: .tvShow).map { $0.genres }
        return Observable.zip(movieGenres, tvShowGenres) { return Set($0 + $1) }
    }

    private func getGenre(resource: Media.Resource) -> Observable<ListOfGenres> {
        return observableRequest(API.Genre(resource: resource))
    }
}
