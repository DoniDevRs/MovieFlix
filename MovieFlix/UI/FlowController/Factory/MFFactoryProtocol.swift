//
//  MFFactoryProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public protocol MFFactoryProtocol {
    func makeMFHomeViewController() -> MFMovieHomeViewController
    func makeMFMovieDetailViewController(movieId: Int) -> MFMovieDetailViewController
}
