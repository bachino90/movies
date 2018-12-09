//
//  RouterRequest.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import Alamofire

protocol RouterRequest: URLConvertible {
    var baseURLString: String { get }
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension RouterRequest {

    var baseURLString: String { return "https://api.themoviedb.org/3/" }

    var headers: [String: String]? { return nil }

    var encoding: Alamofire.ParameterEncoding { return URLEncoding.queryString }

    var URLString: String { return "\(baseURLString)\(path)" }

    var method: Alamofire.HTTPMethod { return .get }

    func asURL() throws -> URL { return Foundation.URL(string: URLString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)! }

    // FOR v4
    // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzFhYzZlYTU3M2VhY2RhMDI5YWIwYTczMzgyZTNhNCIsInN1YiI6IjVjMDcwMzA2YzNhMzY4NjVkYzBkMWQ4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7pg36ESJWyjRQKZcgltJ-AKkh6cXpASc8RSjzCYqMBo
    var parameters: [String : Any]? {
        return [
            "api_key": "471ac6ea573eacda029ab0a73382e3a4",
            "language": "en-US"
        ]
    }
}
