//
//  GetMovieCreditsUseCaseResponse.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public struct GetMovieCreditsUseCaseResponse: Codable {
    public let id: Int
    public let cast: [MovieCast]
    public let crew: [MovieCrew]

    enum CodingKeys: String, CodingKey {
        case id
        case cast
        case crew
    }
}

public struct MovieCast: Codable {
    public let character: String
    public let name: String
}

public struct MovieCrew: Codable {
    public let job: String
    public let name: String
}
