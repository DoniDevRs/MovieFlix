//
//  GetListMoviesUseCase.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public class GetListMoviesUseCase {
    
    public typealias UseCaseEvent = Result<GetListMoviesUseCaseResponse, NetworkingError>
    private let service: ServiceProtocol
    
    public init(service: ServiceProtocol) {
        self.service = service
    }
}

extension GetListMoviesUseCase: GetListMoviesUseCaseProtocol {
    public func execute(from endpoint: String) -> Observable<UseCaseEvent> {
        let result = ReplaySubject<UseCaseEvent>.create()
        self.service.getListMovies(from: endpoint) { serviceResult in
            result.onNext(serviceResult.mapError { error in
                NetworkingError.unableToComplete
            })
        }
        return result
    }
}
