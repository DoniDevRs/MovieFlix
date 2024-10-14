//
//  MFMovieDetailProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public protocol MFMovieDetailProtocol: AnyObject {
    var content: UIView { get }
    var delegate: MFMovieDetailViewDelegate? { get set }
    
    func updateView(with viewState: MFMovieDetailViewState)
}

extension MFMovieDetailProtocol where Self: UIView {
    public var content: UIView { return self }
}
