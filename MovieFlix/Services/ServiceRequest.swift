//
//  ServiceRequest.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import Alamofire

enum ServiceRequest: RequestProtocol {

    case getListMovies(endPoint: String)
    case getMovieDetail(movieId: Int)
    case getMovieCredits(movieId: Int)
    case getMovieVideo(movieId: Int)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    var path: String {
        switch self {
        case let .getListMovies(endPoint):
            return "/movie/\(endPoint)"
        case let .getMovieDetail(movieId):
            return "/movie/\(movieId)"
        case let .getMovieCredits(movieId):
            return "/movie/\(movieId)/credits"
        case let .getMovieVideo(movieId):
            return "/movie/\(movieId)/videos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListMovies,
             .getMovieDetail,
             .getMovieCredits,
             .getMovieVideo:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getListMovies,
             .getMovieDetail,
             .getMovieCredits,
             .getMovieVideo:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getListMovies,
             .getMovieDetail,
             .getMovieCredits,
             .getMovieVideo:
            return nil
        }
    }
}
