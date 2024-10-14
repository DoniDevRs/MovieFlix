//
//  MFMovieDetailProtocols.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public protocol MFMovieDetailViewControllerProtocol: AnyObject {
    var contentView: MFMovieDetailProtocol? { get }
    var viewModel: MFMovieDetailViewModelProtocol? { get }
    
    func updateView(with viewState: MFMovieDetailViewState)
    func showDialog(with dialog: DialogEntity)
    func presentSafariVC(with url: URL)
    func presentMFDialogOnMainThread(_ dialogEntity: DialogEntity)
}

public protocol MFMovieDetailViewModelProtocol: AnyObject {
    var viewController: MFMovieDetailViewControllerProtocol? { get set }
    var viewState: MFMovieDetailViewState { get }
    var movieId: Int { get set }
    
    func initState()
    func getMovieVideo()
    func likeMovieTapped()
}

public protocol MFMovieDetailViewControllerDelegate: AnyObject {
    
}
