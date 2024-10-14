//
//  MFMovieIntroViewProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public protocol MFMovieIntroViewProtocol: AnyObject {
    var content: UIView { get }
    var delegate: MFMovieIntroViewDelegate? { get set }
}

public protocol MFMovieIntroViewDelegate: AnyObject {
    func didTapButtonEnter()
}

extension MFMovieIntroViewProtocol where Self: UIView {
    public var content: UIView { return self }
}
