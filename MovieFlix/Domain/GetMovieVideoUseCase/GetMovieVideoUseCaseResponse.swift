//
//  GetMovieVideoUseCaseResponse.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public struct GetMovieVideoUseCaseResponse: Codable {
    public let results: [MovieVideo]
}

public struct MovieVideo: Codable {
    public let id: String
    public let key: String
    public let name: String
    public let site: String
    
    public var youtubeURL: URL? {
        guard site == "Youtube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
