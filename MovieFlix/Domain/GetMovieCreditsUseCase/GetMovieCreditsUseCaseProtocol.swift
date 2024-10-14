//
//  GetMovieCreditsUseCaseProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public protocol GetMovieCreditsUseCaseProtocol: AnyObject {
    func execute(movieId: Int) -> Observable<Result<GetMovieCreditsUseCaseResponse, NetworkingError>>
}
