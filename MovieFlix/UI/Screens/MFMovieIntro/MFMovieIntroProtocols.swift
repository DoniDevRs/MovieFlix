//
//  MFMovieIntroProtocols.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

public protocol MFMovieIntroViewControllerProtocol: AnyObject {
    var contentView: MFMovieIntroViewProtocol? { get }
}

public protocol MFMovieIntroViewControllerDelegate: AnyObject {
    func goToMovieHome()
}
