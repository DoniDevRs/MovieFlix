//
//  ServiceImplementation.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public class ServiceImplementation {
    let operation: NetworkingOperationProtocol
    
    public init(operation: NetworkingOperationProtocol) {
        self.operation = operation
    }
}

extension ServiceImplementation: ServiceProtocol {
    public func getListMovies(from endpoint: String, completion: @escaping (Result<GetListMoviesUseCaseResponse, NetworkingError>) -> Void) {
        let request = ServiceRequest.getListMovies(endPoint: endpoint)
        operation.execute(request: request, responseType: GetListMoviesUseCaseResponse.self, completion: completion)
    }
    
    public func getMovieDetail(movieId: Int, completion: @escaping (Result<GetMovieDetailUseCaseResponse, NetworkingError>) -> Void) {
        let request = ServiceRequest.getMovieDetail(movieId: movieId)
        operation.execute(request: request, responseType: GetMovieDetailUseCaseResponse.self, completion: completion)
    }
    
    public func getMovieCredits(movieId: Int, completion: @escaping (Result<GetMovieCreditsUseCaseResponse, NetworkingError>) -> Void) {
        let request = ServiceRequest.getMovieCredits(movieId: movieId)
        operation.execute(request: request, responseType: GetMovieCreditsUseCaseResponse.self, completion: completion)
    }
    
    public func getMovieVideo(movieId: Int, completion: @escaping (Result<GetMovieVideoUseCaseResponse, NetworkingError>) -> Void) {
        let request = ServiceRequest.getMovieVideo(movieId: movieId)
        operation.execute(request: request, responseType: GetMovieVideoUseCaseResponse.self, completion: completion)
    }
}
