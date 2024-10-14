//
//  GetMovieDetailUseCase.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public class GetMovieDetailUseCase {
    
    public typealias UseCaseEvent = Result<GetMovieDetailUseCaseResponse, NetworkingError>
    private let service: ServiceProtocol
    
    public init(service: ServiceProtocol) {
        self.service = service
    }
}

extension GetMovieDetailUseCase: GetMovieDetailUseCaseProtocol {
    public func execute(movieId: Int) -> Observable<UseCaseEvent> {
        let result = ReplaySubject<UseCaseEvent>.create()
        self.service.getMovieDetail(movieId: movieId) { serviceResult in
            result.onNext(serviceResult.mapError({ error in
                NetworkingError.unableToComplete
            }))
        }
        return result
    }
}
