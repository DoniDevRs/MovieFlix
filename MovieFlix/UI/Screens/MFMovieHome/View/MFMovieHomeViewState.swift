//
//  MFMovieHomeViewState.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

public enum MFMovieHomeViewState {
    case hasNowPlaying([MFMovieEntity])
    case hasUpcoming([MFMovieEntity])
    case hasTopRated([MFMovieEntity])
    case hasPopular([MFMovieEntity])
    case hasError(ErrorViewEntity?)
    case isLoading(Bool)
    case isEmpty
}
