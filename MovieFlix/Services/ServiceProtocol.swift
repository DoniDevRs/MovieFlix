//
//  ServiceProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public protocol ServiceProtocol {
    func getListMovies(from endpoint: String, completion: @escaping (Result<GetListMoviesUseCaseResponse, NetworkingError>) -> Void)
    func getMovieDetail(movieId: Int, completion: @escaping (Result<GetMovieDetailUseCaseResponse, NetworkingError>) -> Void)
    func getMovieCredits(movieId: Int, completion: @escaping (Result<GetMovieCreditsUseCaseResponse, NetworkingError>) -> Void)
    func getMovieVideo(movieId: Int, completion: @escaping (Result<GetMovieVideoUseCaseResponse, NetworkingError>) -> Void)
}
