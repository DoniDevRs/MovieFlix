//
//  MFMovieDetailState.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public enum MFMovieDetailViewState {
    case hasData(MFMovieDetailEntity)
    case isLoading(Bool)
    case hasError(ErrorViewEntity?)
    case isEmpty
}
