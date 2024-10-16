//
//  MFMovieFavoritesProtocols.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public protocol MFMovieFavoritesViewControllerProtocol: AnyObject {
    var contentView: MFMovieFavoritesViewProtocol? { get }
    var viewModel: MFMovieFavoritesViewModelProtocol? { get }
    
    func updateView(with viewState: MFMovieFavoritesViewState)
    func presentMFDialogOnMainThread(_ dialogEntity: DialogEntity)
    
}

public protocol MFMovieFavoritesViewModelProtocol: AnyObject {
    var viewController: MFMovieFavoritesViewControllerProtocol? { get }
    var viewState: MFMovieFavoritesViewState { get }
    
    func initState()
}

public protocol MFMovieFavoritesViewControllerDelegate: AnyObject {
    func goToMovieDetail(entity: MFMovieEntity)
}
