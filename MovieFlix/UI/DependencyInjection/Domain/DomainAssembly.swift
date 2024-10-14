//
//  DomainAssembly.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import Swinject

final class DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GetListMoviesUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            return GetListMoviesUseCase(service: service)
        }
        
        container.register(GetMovieDetailUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            return GetMovieDetailUseCase(service: service)
        }
        
        container.register(GetMovieCreditsUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            return GetMovieCreditsUseCase(service: service)
        }
        
        container.register(GetMovieVideoUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            return GetMovieVideoUseCase(service: service)
        }
    }
}
