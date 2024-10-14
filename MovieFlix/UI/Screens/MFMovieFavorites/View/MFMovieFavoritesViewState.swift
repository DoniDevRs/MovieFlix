//
//  MFMovieFavoritesViewState.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

public enum MFMovieFavoritesViewState {
    case hasData([MFMovieEntity])
    case isLoading(Bool)
    case isEmpty
}
