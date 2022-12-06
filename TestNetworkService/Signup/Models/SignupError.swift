//
//  SignupErrors.swift
//  TestNetworkService
//
//  Created by Daniel Washington Ignacio on 22/11/22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case responseModelParsingError
    case invalidRequestURLStringErrors
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidRequestURLStringErrors, .responseModelParsingError:
            return ""
        }
    }
}
