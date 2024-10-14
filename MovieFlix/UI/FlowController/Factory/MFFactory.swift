//
//  MFFactory.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit
import Swinject

public class MFFactory: MFFactoryProtocol {
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    public func makeMFHomeViewController() -> MFMovieHomeViewController {
        let viewModel = resolver.resolveUnwrapping(MFMovieHomeViewModelProtocol.self)
        let homeMoviesVC = MFMovieHomeViewController(viewModel: viewModel)
        viewModel.viewController = homeMoviesVC
        return homeMoviesVC
    }
    
    public func makeMFMovieDetailViewController(movieId: Int) -> MFMovieDetailViewController {
        let viewModel = resolver.resolveUnwrapping(MFMovieDetailViewModelProtocol.self, argument: movieId)
        let movieDetailsVC = MFMovieDetailViewController(viewModel: viewModel)
        viewModel.viewController = movieDetailsVC
        return movieDetailsVC
    }
}
