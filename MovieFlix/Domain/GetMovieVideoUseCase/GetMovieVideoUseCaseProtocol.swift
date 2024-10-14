//
//  GetMovieVideoUseCaseProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public protocol GetMovieVideoUseCaseProtocol: AnyObject {
    func execute(movieId: Int) -> Observable<Result<GetMovieVideoUseCaseResponse, NetworkingError>>
}
