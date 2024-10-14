//
//  NetworkingError.swift
//  MovieFlix
//
//  Created by Doni Silva on 19/09/24.
//

import Foundation
import Alamofire

public enum NetworkingError:  Error {
    case generic(Error)
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToFavorite
    case alreadyInFavorites
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case .generic(let message):
            return message.asAFError?.localizedDescription ?? message.localizedDescription
        case .unableToComplete:
            return "unableToComplete".localized
        case .invalidResponse:
            return "invalidResponse".localized
        case .invalidData:
            return "invalidData".localized
        case .unableToFavorite:
            return "unableToFavorite".localized
        case .alreadyInFavorites:
            return "alreadyInFavorites".localized
        case .invalidURL:
            return "invalidURL".localized
        }
    }
}
