//
//  GetMovieVideoUseCase.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public class GetMovieVideoUseCase {
    
    public typealias UseCaseEvent = Result<GetMovieVideoUseCaseResponse, NetworkingError>
    private let service: ServiceProtocol
    
    public init(service: ServiceProtocol) {
        self.service = service
    }
    
}

extension GetMovieVideoUseCase: GetMovieVideoUseCaseProtocol {
    public func execute(movieId: Int) -> Observable<Result<GetMovieVideoUseCaseResponse, NetworkingError>> {
        let result = ReplaySubject<UseCaseEvent>.create()
        self.service.getMovieVideo(movieId: movieId) { serviceResult in
            result.onNext(serviceResult.mapError({ error in
                NetworkingError.unableToComplete
            }))
        }
        return result
    }
}
