//
//  NetworkError.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/3/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case network(statusCode: Int)
    case parsing
    case unauthorize
    case notLoggedIn
    case error(NSError)
    case other

    var domain: String {
        switch self {
        case .network(_): return "Network"
        case .parsing: return "Parsing"
        case .unauthorize: return "Unauthorize"
        case .notLoggedIn: return "NotLoggedIn"
        case .error(_): return "Error"
        case .other: return "other"
        }
    }

    var code: Int {
        switch self {
        case .network(let code): return code
        default: return 555
        }
    }

    var info: [String: AnyObject] {
        switch self {
        default: return [:]
        }
    }

    var nsError: NSError {
        switch self {
        case .error(let error): return error
        default: return NSError(domain: domain, code: code, userInfo: info)
        }
    }
}
