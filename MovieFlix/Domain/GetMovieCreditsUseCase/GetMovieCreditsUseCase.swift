//
//  GetMovieCreditsUseCase.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public class GetMovieCreditsUseCase {
    
    public typealias UseCaseEvent = Result<GetMovieCreditsUseCaseResponse, NetworkingError>
    private let service: ServiceProtocol
    
    public init(service: ServiceProtocol) {
        self.service = service
    }
    
}

extension GetMovieCreditsUseCase: GetMovieCreditsUseCaseProtocol {
    public func execute(movieId: Int) -> Observable<UseCaseEvent> {
        let result = ReplaySubject<UseCaseEvent>.create()
        self.service.getMovieCredits(movieId: movieId) { serviceResult in
            result.onNext(serviceResult.mapError({ error in
                NetworkingError.unableToComplete
            }))
        }
        return result
    }
}
