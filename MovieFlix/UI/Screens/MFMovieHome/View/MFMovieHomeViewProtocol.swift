//
//  MFMovieHomeViewProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public protocol MFMovieHomeViewProtocol: AnyObject {
    var content: UIView { get }
    var delegate: MFMovieHomeViewDelegate? { get set }
    
    func updateView(with viewState: MFMovieHomeViewState)
}

extension MFMovieHomeViewProtocol where Self: UIView {
    public var content: UIView { return self }
}
