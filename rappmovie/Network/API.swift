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

    // FOR v4
    // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzFhYzZlYTU3M2VhY2RhMDI5YWIwYTczMzgyZTNhNCIsInN1YiI6IjVjMDcwMzA2YzNhMzY4NjVkYzBkMWQ4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7pg36ESJWyjRQKZcgltJ-AKkh6cXpASc8RSjzCYqMBo
    static let key = "471ac6ea573eacda029ab0a73382e3a4"
    static var locale: String { return Locale.preferredLanguages.first ?? "en-US" }
    static var basicParams: [String: Any] {
        return [
            "api_key": API.key,
            "language": API.locale
        ]
    }

    struct ResourceList: RouterRequest {
        let resource: Media.Resource
        let category: Media.Category
        let page: Int

        var path: String { return "\(resource.rawValue)/\(category.rawValue)" }

        var parameters: [String : Any]? {
            var params = API.basicParams
            params["page"] = page
            return params
        }
    }

    struct Resource: RouterRequest {
        let resource: Media.Resource
        let id: Int

        var path: String { return "\(resource.rawValue)/\(id)" }

        var parameters: [String : Any]? { return API.basicParams }
    }

    struct Video: RouterRequest {
        let resource: Media.Resource
        let id: Int

        var path: String { return "\(resource.rawValue)/\(id)/videos" }

        var parameters: [String : Any]? { return ["api_key": API.key] }
    }

    struct Similars: RouterRequest {
        let resource: Media.Resource
        let id: Int

        var path: String { return "\(resource.rawValue)/\(id)/similar" }

        var parameters: [String : Any]? { return API.basicParams }
    }

    struct Genre: RouterRequest {
        let resource: Media.Resource

        var path: String { return "genre/\(resource.rawValue)/list" }

        var parameters: [String : Any]? { return API.basicParams }
    }

    struct Search: RouterRequest {
        let query: String
        let page: Int

        var path: String { return "search/multi" }

        var parameters: [String : Any]? {
            var params = API.basicParams
            params["query"] = query
            params["page"] = page
            return params
        }
    }
}


