//
//  Router.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import Alamofire

struct API {

    struct ResourceList: RouterRequest {
        let resource: Media.Resource
        let category: Media.Category
        let page: Int

        var baseURLString: String { return "https://api.themoviedb.org/3/" }

        var path: String { return "\(resource.rawValue)/\(category.rawValue)" }

        // FOR v4
        // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzFhYzZlYTU3M2VhY2RhMDI5YWIwYTczMzgyZTNhNCIsInN1YiI6IjVjMDcwMzA2YzNhMzY4NjVkYzBkMWQ4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7pg36ESJWyjRQKZcgltJ-AKkh6cXpASc8RSjzCYqMBo
        var parameters: [String : Any]? {
            return [
                "api_key": "471ac6ea573eacda029ab0a73382e3a4",
                "language": "en-US",
                "page": page,
            ]
        }
    }

    struct Resource: RouterRequest {
        let resource: Media.Resource
        let id: Int

        var path: String { return "\(resource.rawValue)/\(id)" }
    }

    struct Video: RouterRequest {
        let resource: Media.Resource
        let id: Int

        var path: String { return "\(resource.rawValue)/\(id)/videos" }
    }

    struct Genre: RouterRequest {
        let resource: Media.Resource

        var path: String { return "genre/\(resource.rawValue)/list" }
    }

    struct Search: RouterRequest {
        let query: String
        let page: Int

        var path: String { return "search/multi" }

        var parameters: [String : Any]? {
            return [
                "api_key": "471ac6ea573eacda029ab0a73382e3a4",
                "language": "en-US",
                "query": query,
                "page": page,
            ]
        }
    }
}


