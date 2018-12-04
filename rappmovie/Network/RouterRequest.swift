//
//  RouterRequest.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - RouterURLRequestConvertible

protocol RouterRequest: URLConvertible {
    var baseURLString: String { get }
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

// MARK: - RouterURLRequestConvertible default implementation

extension RouterRequest {

    var headers: [String: String]? { return nil }

    var parameters: [String: Any]? { return nil }

    var encoding: Alamofire.ParameterEncoding { return URLEncoding.queryString }

    var URLString: String { return "\(baseURLString)\(path)" }

    var method: Alamofire.HTTPMethod { return .get }

    func asURL() throws -> URL { return Foundation.URL(string: URLString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)! }
}
