//
//  ModuleAssembly.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import Swinject

final class ModuleAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MFFactoryProtocol.self) { resolver in
            return MFFactory(resolver: resolver)
        }
        
        container.register(MFMovieHomeViewModelProtocol.self) { resolver in
            let getListMoviesUseCase = resolver.resolveUnwrapping(GetListMoviesUseCaseProtocol.self)
            return MFMovieHomeViewModel(getListMoviesUseCase: getListMoviesUseCase)
        }
        
        container.register(MFMovieDetailViewModelProtocol.self) { (resolver, movieId: Int) in
            let getMovieDetailUseCase = resolver.resolveUnwrapping(GetMovieDetailUseCaseProtocol.self)
            let getMovieCreditsUseCase = resolver.resolveUnwrapping(GetMovieCreditsUseCaseProtocol.self)
            let getMovieVideoUseCase = resolver.resolveUnwrapping(GetMovieVideoUseCaseProtocol.self)
            return MFMovieDetailViewModel(getMovieDetailUseCase: getMovieDetailUseCase, 
                                          getMovieCreditsUseCase: getMovieCreditsUseCase,
                                          getMovieVideoUseCase: getMovieVideoUseCase,
                                          movieId: movieId)
        }
    }
}
