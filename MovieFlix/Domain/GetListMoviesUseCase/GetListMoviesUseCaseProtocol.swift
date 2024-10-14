//
//  GetListMoviesUseCaseProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation
import RxSwift

public protocol GetListMoviesUseCaseProtocol: AnyObject {
    func execute(from endpoint: String) -> Observable<Result<GetListMoviesUseCaseResponse, NetworkingError>>
}
